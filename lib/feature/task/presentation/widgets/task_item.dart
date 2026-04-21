import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/focusflow_text.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback? onTap;
  final ValueChanged<bool?>? onChanged;

  const TaskItem({
    super.key,
    required this.title,
    this.isCompleted = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s),
      child: AppCard(
        onTap: onTap,
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              activeColor: AppColors.primary,
              side: BorderSide(
                color: AppColors.textSecondary.withOpacity(0.4),
              ),
              onChanged: onChanged,
            ),

            const SizedBox(width: AppSpacing.s),

            Expanded(
              child: FocusFlowText.body(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                color: isCompleted
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
            ),

            if (isCompleted)
              const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}