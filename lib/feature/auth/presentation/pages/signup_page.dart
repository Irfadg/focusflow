import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;

  void _signup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    if (name.isEmpty) {
      AppSnackbar.error(context, 'Please enter your name');
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      AppSnackbar.error(context, 'Please enter a valid email address');
      return;
    }

    if (password.length < 6) {
      AppSnackbar.error(context, 'Password must be at least 6 characters');
      return;
    }

    if (password != confirm) {
      AppSnackbar.error(context, 'Passwords do not match');
      return;
    }

    setState(() => _isLoading = true);

    // Mock network delay
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);

      // Simulate existing user
      if (email == 'exists@test.com') {
        AppSnackbar.error(context, 'User already exists');
        return;
      }

      // Success
      AppSnackbar.success(context, 'Account created successfully');
      context.go(RouteNames.home);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpacing.gapXL,
              const FocusFlowText(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                color: AppColors.primary,
              ),
              AppSpacing.gapS,
              const FocusFlowText(
                'Join us to boost your productivity.',
                color: AppColors.textSecondary,
              ),
              AppSpacing.gapXL,
              AppTextField(
                controller: _nameController,
                hint: 'Full Name',
                prefixIcon: Icons.person_outline,
              ),
              AppSpacing.gapM,
              AppTextField(
                controller: _emailController,
                hint: 'Email',
                prefixIcon: Icons.email_outlined,
              ),
              AppSpacing.gapM,
              AppTextField(
                controller: _passwordController,
                hint: 'Password',
                password: true,
                prefixIcon: Icons.lock_outline,
              ),
              AppSpacing.gapM,
              AppTextField(
                controller: _confirmController,
                hint: 'Confirm Password',
                password: true,
                prefixIcon: Icons.lock_outline,
              ),
              AppSpacing.gapXL,
              FocusFlowButton(
                text: 'Sign Up',
                loading: _isLoading,
                onPressed: _signup,
              ),
              AppSpacing.gapL,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FocusFlowText(
                    'Already have an account?',
                    color: AppColors.textSecondary,
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const FocusFlowText(
                      'Login',
                      color: AppColors.primary,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              AppSpacing.gapXL,
            ],
          ),
        ),
      ),
    );
  }
}
