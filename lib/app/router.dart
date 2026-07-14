import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/main/presentation/main_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",

  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: "/main",
      builder: (context, state) => const MainScreen(),
    ),
  ],
);