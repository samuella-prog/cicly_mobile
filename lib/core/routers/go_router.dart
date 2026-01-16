import 'package:cicly/ui/screens/home_screen.dart';
import 'package:cicly/ui/screens/onboarding_complete_screen.dart';
import 'package:cicly/ui/screens/onboarding_diseases_screen.dart';
import 'package:cicly/ui/screens/onboarding_last_period_screen.dart';
import 'package:cicly/ui/screens/onboarding_stats_screen.dart';
import 'package:cicly/ui/screens/onboarding_welcome_screen.dart';
import 'package:cicly/ui/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

//---------------------- App Router ---------------------------//
/// Define the app's router using GoRouter
/// This sets up the navigation structure of the app.
/// Each route corresponds to a screen in the app.
/// The routes are nested to represent the hierarchy of screens.
//------------------------------------------------------------//
final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: '/onboarding-welcome',
          builder: (context, state) {
            return OnboardingWelcomeScreen();
          },
          routes: [
            GoRoute(
              path: '/onboarding-complete',
              builder: (context, state) {
                return OnboardingCompleteScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            // return HomeScreen();
            return HomeScreen();
          },
          routes: [
            GoRoute(
              path: '/onboarding-diseases',
              builder: (context, state) {
                return OnboardingDiseasesScreen();
              },
            ),
            GoRoute(
              path: '/onboarding-last-period',
              builder: (context, state) {
                return OnboardingLastPeriodScreen();
              },
            ),
            GoRoute(
              path: '/onboarding-stats',
              builder: (context, state) {
                return OnboardingStatsScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
