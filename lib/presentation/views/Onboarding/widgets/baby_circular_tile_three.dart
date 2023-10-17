import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class BabyCircularTileThree extends ConsumerStatefulWidget {
  const BabyCircularTileThree({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BabyCircularTileThreeState();
}

class _BabyCircularTileThreeState extends ConsumerState<BabyCircularTileThree> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => AnimatedPositioned(
        left: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[2].left,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[3].left,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[0].left,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[1].left,
        },
        top: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[2].top,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[3].top,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[0].top,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[1].top,
        },
        duration: const Duration(milliseconds: 500),
        child: CircleAvatar(
          backgroundColor: switch (currentOnboardingState) {
            OnboardingStates.FirstState =>
              currentOnboardingState.babyIconColorSet[2],
            OnboardingStates.SecondState =>
              currentOnboardingState.babyIconColorSet[3],
            OnboardingStates.ThirdState =>
              currentOnboardingState.babyIconColorSet[0],
            OnboardingStates.FourthState =>
              currentOnboardingState.babyIconColorSet[1],
          },
          radius: 22,
          child: Image.asset(
            "assets/images/baby_face_three.png",
            height: 30,
            width: 30,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
