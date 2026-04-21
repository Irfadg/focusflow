import 'package:focusflow/feature/feature.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteNames.splash,

    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => const SignUpPage(),
      ),

      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
  path: '/main',
  builder: (context, state) => const MainNavigationPage(),
),
    ],
  );
}
