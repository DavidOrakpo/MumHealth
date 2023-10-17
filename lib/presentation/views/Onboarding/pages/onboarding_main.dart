import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:template/core/Enums/enums.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/views/Onboarding/pages/loading_screen.dart';
import 'package:template/presentation/views/Onboarding/viewModel/onboarding_viewmodel.dart';
import 'package:template/presentation/views/Onboarding/widgets/baby_circular_tile_four.dart';
import 'package:template/presentation/views/Onboarding/widgets/baby_circular_tile_one.dart';
import 'package:template/presentation/views/Onboarding/widgets/baby_circular_tile_three.dart';
import 'package:template/presentation/views/Onboarding/widgets/baby_circular_tile_two.dart';
import 'package:template/presentation/views/Onboarding/widgets/navigate_onboarding.dart';
import 'package:template/presentation/views/Onboarding/widgets/onboarding_center_image_tile.dart';
import 'package:template/presentation/views/Onboarding/widgets/onboarding_subtitle_text.dart';
import 'package:template/presentation/views/Onboarding/widgets/onboarding_title_text.dart';
import 'package:template/presentation/views/components/primary_button.dart';

class OnboardingMainPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "ONBOARDING_MAIN_PAGE";
  const OnboardingMainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingMainPageState();
}

class _OnboardingMainPageState extends ConsumerState<OnboardingMainPage>
    with SingleTickerProviderStateMixin {
  List<Rect> animatingWidgetRectPositions = [];
  List<OnboardingStates> onboardingStatesList = OnboardingStates.values;

  @override
  void initState() {
    super.initState();
    ref.read(onBoardingVM).animationController =
        AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(onBoardingVM);
    final size = MediaQuery.sizeOf(context);
    const double widgetSize = 40;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: provider.currentOnboardingState,
        builder: (context, currentOnboardingState, child) {
          return ValueListenableBuilder(
            valueListenable: provider.animate,
            builder: (context, animate, child) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (size.height * 0.11).verticalSpace(),
                      Center(
                        child: SizedBox(
                          height: size.width * 0.85,
                          width: size.width * 0.85,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              animatingWidgetRectPositions.addAll([
                                Rect.fromLTWH(
                                  constraints.maxWidth / 2 - widgetSize / 2,
                                  0,
                                  widgetSize,
                                  widgetSize,
                                ),
                                Rect.fromLTWH(
                                  constraints.maxWidth - widgetSize,
                                  constraints.maxHeight / 2 - widgetSize / 2,
                                  widgetSize,
                                  widgetSize,
                                ),
                                Rect.fromLTWH(
                                  constraints.maxWidth / 2 - widgetSize / 2,
                                  constraints.maxHeight - widgetSize,
                                  widgetSize,
                                  widgetSize,
                                ),
                                Rect.fromLTWH(
                                  0,
                                  constraints.maxHeight / 2 - widgetSize / 2,
                                  widgetSize,
                                  widgetSize,
                                ),
                              ]);
                              provider.animatingWidgetRectPositions =
                                  animatingWidgetRectPositions;

                              return const Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,

                                // fit: StackFit.passthrough,
                                children: [
                                  OnboardingCenterImageTile(),
                                  BabyCircularTileOne(),
                                  BabyCircularTileTwo(),
                                  BabyCircularTileThree(),
                                  BabyCircularTileFour()
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      40.0.verticalSpace(),
                      AnimatedSmoothIndicator(
                        activeIndex: onboardingStatesList
                            .indexOf(currentOnboardingState),
                        count: 4,
                        effect: ExpandingDotsEffect(
                          expansionFactor: 2.2,
                          dotWidth: 8,
                          spacing: 4,
                          dotHeight: 6,
                          dotColor: AppColors.primary.shade100.withOpacity(0.5),
                          activeDotColor: ((onboardingStatesList
                                          .indexOf(currentOnboardingState)) %
                                      2 ==
                                  0)
                              ? AppColors.accent
                              : AppColors.primary,
                        ),
                      ),
                      40.0.verticalSpace(),
                      const OnboardingTitleText(),
                      13.0.verticalSpace(),
                      const OnboardingSubtitleText(),
                      20.0.verticalSpace(),
                    ],
                  ),
                  if (currentOnboardingState == OnboardingStates.FourthState)
                    Align(
                      alignment: const Alignment(0, 0.77),
                      child: PrimaryButton(
                        onPressed: () {
                          context.pushNamed(LoadingScreenPage.routeIdentifier);
                        },
                        width: double.infinity,
                        height: 50,
                        cornerRadius: 10,
                        text: "Get Started",
                        textColor: AppColors.white,
                        fontSize: 18,
                      )
                          .padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24))
                          .animate()
                          .fadeIn(),
                    ),
                  const NavigateOnboardingWidgets()
                ],
              );
            },
          );
        },
      ),
    );
  }
}
