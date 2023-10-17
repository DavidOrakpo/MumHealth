import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class BabyCircularTileFour extends ConsumerStatefulWidget {
  const BabyCircularTileFour({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BabyCircularTileFourState();
}

class _BabyCircularTileFourState extends ConsumerState<BabyCircularTileFour> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => AnimatedPositioned(
        left: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[3].left,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[0].left,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[1].left,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[2].left,
        },
        top: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[3].top,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[0].top,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[1].top,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[2].top,
        },
        duration: const Duration(milliseconds: 500),
        child: CircleAvatar(
          backgroundColor: switch (currentOnboardingState) {
            OnboardingStates.FirstState =>
              currentOnboardingState.babyIconColorSet[3],
            OnboardingStates.SecondState =>
              currentOnboardingState.babyIconColorSet[0],
            OnboardingStates.ThirdState =>
              currentOnboardingState.babyIconColorSet[1],
            OnboardingStates.FourthState =>
              currentOnboardingState.babyIconColorSet[2],
          },
          radius: 22,
          child: Image.asset(
            "assets/images/baby_face_four.png",
            height: 30,
            width: 30,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
