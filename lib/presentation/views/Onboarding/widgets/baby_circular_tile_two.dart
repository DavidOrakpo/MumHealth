import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class BabyCircularTileTwo extends ConsumerStatefulWidget {
  const BabyCircularTileTwo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BabyCircularTileTwoState();
}

class _BabyCircularTileTwoState extends ConsumerState<BabyCircularTileTwo> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => AnimatedPositioned(
        left: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[1].left,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[2].left,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[3].left,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[0].left,
        },
        top: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[1].top,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[2].top,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[3].top,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[0].top,
        },
        duration: const Duration(milliseconds: 500),
        child: CircleAvatar(
          backgroundColor: switch (currentOnboardingState) {
            OnboardingStates.FirstState =>
              currentOnboardingState.babyIconColorSet[1],
            OnboardingStates.SecondState =>
              currentOnboardingState.babyIconColorSet[2],
            OnboardingStates.ThirdState =>
              currentOnboardingState.babyIconColorSet[3],
            OnboardingStates.FourthState =>
              currentOnboardingState.babyIconColorSet[0],
          },
          radius: 22,
          child: Image.asset(
            "assets/images/baby_face_two.png",
            height: 30,
            width: 30,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
