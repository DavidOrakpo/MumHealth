import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingPageVM =
    ChangeNotifierProvider.autoDispose((ref) => _LoadingPageViewModel());

class _LoadingPageViewModel with ChangeNotifier {
  AnimationController? milkDropController;
  Tween<double>? animationTween;

  AnimationController? controller1;
  Animation<double>? animation1;

  AnimationController? controller2;
  Animation<double>? animation2;

  AnimationController? controller3;
  Animation<double>? animation3;

  AnimationController? controller4;
  Animation<double>? animation4;

  Timer? timer1;
  Timer? timer2;
  Timer? timer3;

  void initializeAnimationTimer() {
    controller4!.forward();

    timer3 = Timer(const Duration(milliseconds: 800), () {
      controller3!.forward();
    });
    //
    timer2 = Timer(const Duration(milliseconds: 1600), () {
      controller2!.forward();
    });
    //
    timer1 = Timer(const Duration(milliseconds: 2000), () {
      controller1!.forward();
    });
  }

  void cleanUp() {
    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
    milkDropController?.dispose();
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();
  }
}
