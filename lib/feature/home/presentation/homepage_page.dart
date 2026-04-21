import 'package:flutter/material.dart';
import 'package:focusflow/feature/task/task.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/focusflow_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // Trigger animation after build
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {"title": "Complete UI design", "done": false},
      {"title": "Build onboarding flow", "done": true},
      {"title": "Setup navigation", "done": true},
      {"title": "Prepare dashboard UI", "done": false},
    ];

    final completedCount =
        tasks.where((t) => t["done"] as bool).length;
    final totalCount = tasks.length;
    final progress =
        totalCount == 0 ? 0.0 : completedCount / totalCount;

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              _buildHeader(),

              AppSpacing.vL,

              /// Progress Card
              _buildProgressCard(
                completedCount,
                totalCount,
                progress,
              ),

              AppSpacing.vL,

              /// Section Title
              const FocusFlowText.title("Today's Tasks"),

              AppSpacing.vM,

              /// Task List with animation
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 400 + (index * 100)),
                      opacity: _visible ? 1 : 0,
                      child: AnimatedSlide(
                        duration:
                            Duration(milliseconds: 400 + (index * 100)),
                        offset:
                            _visible ? Offset.zero : const Offset(0, 0.1),
                        child: TaskItem(
                          title: task["title"] as String,
                          isCompleted: task["done"] as bool,
                          onChanged: (_) {},
                        ),
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

  /// Header
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FocusFlowText.heading("Hello, Irfad 👋"),
        AppSpacing.vS,
        FocusFlowText.body("Let’s stay productive today"),
      ],
    );
  }

  /// Progress Card with animation
  Widget _buildProgressCard(
    int completed,
    int total,
    double progress,
  ) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FocusFlowText.title("Today's Progress"),

          AppSpacing.vS,

          FocusFlowText.body("$completed of $total tasks completed"),

          AppSpacing.vM,

          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 800),
            tween: Tween(begin: 0, end: progress),
            builder: (context, value, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  backgroundColor:
                      AppColors.textSecondary.withOpacity(0.1),
                  valueColor:
                      const AlwaysStoppedAnimation(AppColors.primary),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}