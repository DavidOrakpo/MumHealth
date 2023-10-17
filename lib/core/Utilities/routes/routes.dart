import 'package:go_router/go_router.dart';

import 'package:template/core/Alerts/context.dart';
import 'package:template/core/Utilities/Transitions/transitions.dart';
import 'package:template/presentation/views/Home/home_page.dart';
import 'package:template/presentation/views/Onboarding/pages/loading_screen.dart';
import 'package:template/presentation/views/Onboarding/pages/onboarding_main.dart';
import 'package:template/presentation/views/Onboarding/widgets/flowing_milk.dart';
import 'package:template/presentation/views/SplashScreen/pages/splash_screen.dart';

/// Manages the routing of pages within the app using [GoRouter]
class AppRoutes {
  AppRoutes._internal();
  static final AppRoutes _instance = AppRoutes._internal();
  factory AppRoutes() {
    return _instance;
  }

  /// The routing object that contains the list of routes for navigation.
  ///
  /// It is assigned a navigator Key [AppNavigator().navKey] to retrieve the current Build Context.
  final GoRouter router = GoRouter(
    navigatorKey: AppNavigator().navKey,
    routes: [
      GoRoute(
        path: "/",
        name: SplashScreenPage.routeIdentifier,
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        path: "/onboardingPage",
        name: OnboardingMainPage.routeIdentifier,
        builder: (context, state) => const OnboardingMainPage(),
        routes: [
          GoRoute(
            path: "loadingScreen",
            name: LoadingScreenPage.routeIdentifier,
            builder: (context, state) => const LoadingScreenPage(),
          ),
        ],
      ),
      GoRoute(
        path: "/home",
        name: HomePage.routeIdentifier,
        builder: (context, state) => const HomePage(),
        pageBuilder: (context, state) {
          return CustomFadeTransition(
            key: state.pageKey,
            child: const HomePage(),
          );
        },
      )
    ],
  );
}
