import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/focusflow_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Avatar
              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),

              AppSpacing.vM,

              /// Name
              const FocusFlowText.title("Irfad"),

              AppSpacing.vS,

              /// Email
              const FocusFlowText.body("irfad@email.com"),

              AppSpacing.vL,

              /// Options
              _buildOption("Edit Profile", Icons.edit),
              AppSpacing.vS,
              _buildOption("Settings", Icons.settings),

              AppSpacing.vL,

              /// Logout
              FocusFlowButton(
                text: "Logout",
                onPressed: () {
                  context.go('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String title, IconData icon) {
    return AppCard(
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          AppSpacing.hM,
          Expanded(child: FocusFlowText.body(title)),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}