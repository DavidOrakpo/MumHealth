import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class BabyCircularTileOne extends ConsumerStatefulWidget {
  const BabyCircularTileOne({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BabyCircularTileState();
}

class _BabyCircularTileState extends ConsumerState<BabyCircularTileOne> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    return ValueListenableBuilder(
      valueListenable: provider.currentOnboardingState,
      builder: (context, currentOnboardingState, child) => AnimatedPositioned(
        left: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[0].left,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[1].left,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[2].left,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[3].left,
        },
        top: switch (currentOnboardingState) {
          OnboardingStates.FirstState =>
            provider.animatingWidgetRectPositions[0].top,
          OnboardingStates.SecondState =>
            provider.animatingWidgetRectPositions[1].top,
          OnboardingStates.ThirdState =>
            provider.animatingWidgetRectPositions[2].top,
          OnboardingStates.FourthState =>
            provider.animatingWidgetRectPositions[3].top,
        },
        duration: const Duration(milliseconds: 500),
        child: CircleAvatar(
          // backgroundColor: currentOnboardingState.babyIconColorSet,
          backgroundColor: switch (currentOnboardingState) {
            OnboardingStates.FirstState =>
              currentOnboardingState.babyIconColorSet[0],
            OnboardingStates.SecondState =>
              currentOnboardingState.babyIconColorSet[1],
            OnboardingStates.ThirdState =>
              currentOnboardingState.babyIconColorSet[2],
            OnboardingStates.FourthState =>
              currentOnboardingState.babyIconColorSet[3],
          },
          radius: 22,
          child: Image.asset(
            "assets/images/baby_face_one.png",
            height: 30,
            width: 30,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
