import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Utilities/logger/logger.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class OnboardingSubtitleText extends ConsumerStatefulWidget {
  const OnboardingSubtitleText({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingSubtitleTextState();
}

class _OnboardingSubtitleTextState
    extends ConsumerState<OnboardingSubtitleText> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => FractionallySizedBox(
        widthFactor: 0.8,
        child: Text(
          currentOnboardingState.subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyThree.copyWith(
            color: AppColors.black,
            fontSize: 14,
            // fontWeight: FontWeight.w800,
          ),
        )
            .animate(
              autoPlay: false,
              onComplete: (controller) {
                provider.subtitleController?.reset();
              },
              // controller: _animationController,

              onInit: (controller) {
                provider.subtitleController = controller;
                provider.subtitleController?.addListener(() {});
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
