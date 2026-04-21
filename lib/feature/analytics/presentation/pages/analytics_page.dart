import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/focusflow_text.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final int completed = 12;
    final int pending = 5;
    final double progress = completed / (completed + pending);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FocusFlowText.heading("Analytics"),

              AppSpacing.vL,

              /// Summary Cards
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      "Completed",
                      completed.toString(),
                      AppColors.success,
                    ),
                  ),
                  AppSpacing.hM,
                  Expanded(
                    child: _buildStatCard(
                      "Pending",
                      pending.toString(),
                      AppColors.warning,
                    ),
                  ),
                ],
              ),

              AppSpacing.vL,

              /// Progress Section
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FocusFlowText.title("Weekly Progress"),

                    AppSpacing.vM,

                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween(begin: 0, end: progress),
                      builder: (context, value, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: value,
                                minHeight: 10,
                                backgroundColor: AppColors.textSecondary.withOpacity(0.1),
                                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                              ),
                            ),
                            AppSpacing.vS,
                            FocusFlowText.body(
                              "${(value * 100).toInt()}% productivity",
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              AppSpacing.vL,

              /// Placeholder Chart
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    FocusFlowText.title("Insights"),
                    AppSpacing.vM,
                    Center(
                      child: Icon(
                        Icons.bar_chart,
                        size: 80,
                        color: AppColors.secondary,
                      ),
                    ),
                    AppSpacing.vS,
                    Center(
                      child: FocusFlowText.body("Charts coming soon"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FocusFlowText.body(title),
          AppSpacing.vS,
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}