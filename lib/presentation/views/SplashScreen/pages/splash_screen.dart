import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/views/Onboarding/pages/onboarding_main.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeIdentifier = "SPLASH_SCREEN_PAGE";
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        2.seconds,
        () {
          context.goNamed(OnboardingMainPage.routeIdentifier);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: FractionallySizedBox(
            heightFactor: 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/app_icon.png",
                  scale: 3,
                ),
                Image.asset(
                  "assets/icons/app_icon_title.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
