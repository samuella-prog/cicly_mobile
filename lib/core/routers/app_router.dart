import 'package:cicly/ui/screens/home_screen.dart';
import 'package:cicly/ui/screens/onboarding_diseases_screen.dart';
import 'package:cicly/ui/screens/onboarding_last_period_screen.dart';
import 'package:cicly/ui/screens/onboarding_welcome_screen.dart';
import 'package:cicly/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          );
        
        case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingWelcomeScreen(),
        );

        case AppRoutes.onboardingLastPeriod:
        return MaterialPageRoute(
          builder: (_) => const OnboardingLastPeriodScreen(),
        );

        case AppRoutes.onboardingDiseases:
        return MaterialPageRoute(
          builder: (_) => const OnboardingDiseasesScreen(),
        );

        case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        
      default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Erreur: Route ${settings.name} introuvable'),
          ),
        ),
        );
    }
  }
  static Route<dynamic> createRoute({
    required Widget screen, 
    RouteSettings? settings, 
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => screen, 
      transitionsBuilder:(context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve:curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      } 
      );
  }
}