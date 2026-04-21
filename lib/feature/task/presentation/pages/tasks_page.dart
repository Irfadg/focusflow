import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/focusflow_text.dart';
import '../widgets/task_item.dart';
import '../widgets/add_task_bottom_sheet.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String selectedFilter = "All";

  final List<String> filters = ["All", "Completed", "Pending"];

  final List<Map<String, dynamic>> tasks = [
    {"title": "Complete UI design", "done": false, "priority": "High"},
    {"title": "Build onboarding flow", "done": true, "priority": "Medium"},
    {"title": "Setup navigation", "done": true, "priority": "Low"},
  ];

  List<Map<String, dynamic>> get filteredTasks {
    if (selectedFilter == "Completed") {
      return tasks.where((t) => t["done"] == true).toList();
    } else if (selectedFilter == "Pending") {
      return tasks.where((t) => t["done"] == false).toList();
    }
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: _addTask,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FocusFlowText.heading("Tasks"),

              AppSpacing.vM,

              _buildFilters(),

              AppSpacing.vM,

              Expanded(
                child: ListView.builder(
                  itemCount: filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];

                    return Dismissible(
                      key: Key(task["title"] + index.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.m),
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        setState(() {
                          tasks.remove(task);
                        });
                      },
                      child: TaskItem(
                        title: task["title"],
                        isCompleted: task["done"],
                        onTap: () => _editTask(task),
                        onChanged: (val) {
                          setState(() {
                            task["done"] = val ?? false;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Filters
  Widget _buildFilters() {
    return Row(
      children: filters.map((filter) {
        final isSelected = selectedFilter == filter;

        return Padding(
          padding: const EdgeInsets.only(right: AppSpacing.s),
          child: ChoiceChip(
            label: Text(filter),
            selected: isSelected,
            selectedColor: AppColors.primary,
            onSelected: (_) {
              setState(() {
                selectedFilter = filter;
              });
            },
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Add Task
  void _addTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTaskBottomSheet(
        onSave: (title, priority) {
          setState(() {
            tasks.add({
              "title": title,
              "done": false,
              "priority": priority,
            });
          });
        },
      ),
    );
  }

  /// Edit Task
  void _editTask(Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTaskBottomSheet(
        initialTitle: task["title"],
        initialPriority: task["priority"],
        onSave: (title, priority) {
          setState(() {
            task["title"] = title;
            task["priority"] = priority;
          });
        },
      ),
    );
  }
}