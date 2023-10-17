import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Enums/enums.dart';

final onBoardingVM =
    ChangeNotifierProvider.autoDispose((ref) => _OnboardingViewModel());

class _OnboardingViewModel with ChangeNotifier {
  final double widgetSize = 40;
  List<Rect> animatingWidgetRectPositions = [];

  AnimationController? fadeInController;
  AnimationController? fadeOutController;
  AnimationController? subtitleController;
  AnimationController? animationController;

  ValueNotifier<OnboardingStates> currentOnboardingState =
      ValueNotifier(OnboardingStates.FirstState);

  ValueNotifier<bool> animate = ValueNotifier(true);
}
