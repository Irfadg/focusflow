import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      AppSnackbar.error(context, 'Please enter a valid email address');
      return;
    }

    if (password.length < 6) {
      AppSnackbar.error(context, 'Password must be at least 6 characters');
      return;
    }

    setState(() => _isLoading = true);

    // Mock network delay
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);

      // Simulate network error
      if (email == 'error@test.com') {
        AppSnackbar.error(context, 'Invalid email/password or Network error');
        return;
      }

      // Success
      AppSnackbar.success(context, 'Login successful');
    context.go('/main');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              AppSpacing.gapXXL,
              const FocusFlowText(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                color: AppColors.primary,
              ),
              AppSpacing.gapS,
              const FocusFlowText(
                'Sign in to continue mastering your time.',
                color: AppColors.textSecondary,
              ),
              AppSpacing.gapXL,
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
              AppSpacing.gapS,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    AppSnackbar.success(
                      context,
                      'Reset link sent to your email',
                    );
                  },
                  child: const FocusFlowText(
                    'Forgot password?',
                    color: AppColors.primary,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              AppSpacing.gapL,
              FocusFlowButton(
                text: 'Login',
                loading: _isLoading,
                onPressed: _login,
              ),
              AppSpacing.gapL,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FocusFlowText(
                    'Don\'t have an account?',
                    color: AppColors.textSecondary,
                  ),
                  TextButton(
                    onPressed: () => context.push(RouteNames.signup),
                    child: const FocusFlowText(
                      'Sign Up',
                      color: AppColors.primary,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
