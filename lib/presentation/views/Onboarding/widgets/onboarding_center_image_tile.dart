import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';

class OnboardingCenterImageTile extends ConsumerStatefulWidget {
  const OnboardingCenterImageTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingCenterImageTileState();
}

class _OnboardingCenterImageTileState
    extends ConsumerState<OnboardingCenterImageTile> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    final size = MediaQuery.sizeOf(context);
    return AnimatedContainer(
      duration: 250.milliseconds,
      height: size.height * 0.4,
      width: size.width * 0.8,
      // color: Colors.purple,
      child: ValueListenableBuilder(
        valueListenable: provider.currentOnboardingState,
        builder: (context, currentOnboardingState, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/ellipse_back_drop.svg",
                color: switch (currentOnboardingState) {
                  OnboardingStates.FirstState ||
                  OnboardingStates.ThirdState =>
                    const Color(0xFFFBF2E9),
                  OnboardingStates.SecondState ||
                  OnboardingStates.FourthState =>
                    const Color(0xFFE9EEFB),
                },
              ),
              Align(
                alignment: const Alignment(0, 0),
                child: FadeIn(
                  // animate: animate,
                  manualTrigger: true,
                  duration: const Duration(milliseconds: 250),
                  controller: (controller) =>
                      provider.fadeInController = controller..forward(),
                  child: FadeOut(
                    manualTrigger: true,
                    duration: const Duration(milliseconds: 150),
                    controller: (controller) =>
                        provider.fadeOutController = controller,
                    child: SizedBox(
                      // height: 180,
                      // width: 150,
                      child: Image.asset(
                        currentOnboardingState.onboardingImage,
                        scale: 3.2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
