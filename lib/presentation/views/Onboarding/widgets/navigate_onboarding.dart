import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class NavigateOnboardingWidgets extends ConsumerStatefulWidget {
  const NavigateOnboardingWidgets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigateOnboardingWidgetsState();
}

class _NavigateOnboardingWidgetsState
    extends ConsumerState<NavigateOnboardingWidgets> {
  final onboardingStatesList = OnboardingStates.values;
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => Align(
        alignment: const Alignment(0, 0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentOnboardingState == OnboardingStates.FirstState
                ? const SizedBox()
                : GestureDetector(
                    onTap: () async {
                      var temp =
                          onboardingStatesList.indexOf(currentOnboardingState);
                      if (temp != 0) {
                        provider.animationController?.forward();
                        provider.subtitleController?.forward();
                        await Future.delayed(
                          150.milliseconds,
                          () async {
                            await provider.fadeOutController?.forward();
                            provider.fadeInController?.forward();
                            provider.currentOnboardingState.value =
                                onboardingStatesList[temp - 1];
                          },
                        );
                      }
                    },
                    child: Text(
                      "Previous",
                      style: AppTextStyle.bodyThree.copyWith(
                        color: AppColors.gray.shade300,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            currentOnboardingState == OnboardingStates.FourthState
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: () async {
                      var temp =
                          onboardingStatesList.indexOf(currentOnboardingState);
                      if (temp != 3) {
                        provider.animationController?.forward();
                        provider.subtitleController?.forward();
                        await Future.delayed(
                          150.milliseconds,
                          () async {
                            await provider.fadeOutController?.forward();
                            provider.fadeInController?.forward();
                            provider.currentOnboardingState.value =
                                onboardingStatesList[temp + 1];
                            provider.animationController?.reset();
                          },
                        );
                      }
                    },
                    child: Text(
                      switch (currentOnboardingState) {
                        OnboardingStates.FirstState => "Show me How",
                        OnboardingStates.SecondState ||
                        OnboardingStates.ThirdState =>
                          "Next",
                        OnboardingStates.FourthState => "",
                      },
                      // "Show me How",
                      style: AppTextStyle.bodyThree.copyWith(
                        color: AppColors.primary.shade300,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ],
        ).padding(padding: const EdgeInsets.symmetric(horizontal: 24)),
      ),
    );
  }
}
