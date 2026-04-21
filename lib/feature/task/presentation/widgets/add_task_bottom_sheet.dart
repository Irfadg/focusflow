import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';


class AddTaskBottomSheet extends StatefulWidget {
  final String? initialTitle;
  final String? initialPriority;
  final Function(String title, String priority) onSave;

  const AddTaskBottomSheet({
    super.key,
    this.initialTitle,
    this.initialPriority,
    required this.onSave,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  late TextEditingController titleController;
  String selectedPriority = "Medium";

  final List<String> priorities = ["Low", "Medium", "High"];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle ?? "");
    selectedPriority = widget.initialPriority ?? "Medium";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.m,
        right: AppSpacing.m,
        top: AppSpacing.m,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.m,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FocusFlowText.title("Task"),

          AppSpacing.vM,

          AppTextField(
            controller: titleController,
            hint: "Enter task title",
          ),

          AppSpacing.vM,

          const FocusFlowText.body("Priority"),

          AppSpacing.vS,

          Row(
            children: priorities.map((p) {
              final isSelected = selectedPriority == p;

              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.s),
                child: ChoiceChip(
                  label: Text(p),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  onSelected: (_) {
                    setState(() {
                      selectedPriority = p;
                    });
                  },
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              );
            }).toList(),
          ),

          AppSpacing.vL,

          FocusFlowButton(
            text: "Save Task",
            onPressed: () {
              final title = titleController.text.trim();
              if (title.isEmpty) return;

              widget.onSave(title, selectedPriority);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}