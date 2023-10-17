import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Utilities/logger/logger.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/viewModel/home_page_viewmodel.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class OnboardingTitleText extends ConsumerStatefulWidget {
  const OnboardingTitleText({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingTitleTextState();
}

class _OnboardingTitleTextState extends ConsumerState<OnboardingTitleText> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => FractionallySizedBox(
        widthFactor: 0.6,
        child: Text(
          currentOnboardingState.title,
          textAlign: TextAlign.center,
          style: AppTextStyle.headerTwo.copyWith(
            color: const Color(0xFF3A3A3A),
            fontWeight: FontWeight.w800,
          ),
        )
            .animate(
              autoPlay: false,
              onComplete: (controller) {
                provider.animationController?.reset();
              },
              // controller: _animationController,

              onInit: (controller) {
                provider.animationController = controller;
                provider.animationController?.addListener(() {
                  if (provider.animationController!.isCompleted) {
                    logger.i("Done");
                  }
                });
              },
            )
            .fadeOut(duration: 350.milliseconds)
            .swap(
                builder: (_, child) =>
                    child!.animate().fadeIn(duration: 750.milliseconds)),
      ),
    );
  }
}
