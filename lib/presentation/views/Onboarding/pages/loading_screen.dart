import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Utilities/logger/logger.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/home_page.dart';
import 'package:template/presentation/views/Onboarding/viewModel/loading_page_viremodel.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/views/Onboarding/widgets/drop_of_milk_path.dart';
import 'package:template/presentation/views/Onboarding/widgets/flowing_milk.dart';

class LoadingScreenPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "LOADING_SCREEN_PAGE";
  const LoadingScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoadingScreenPageState();
}

class _LoadingScreenPageState extends ConsumerState<LoadingScreenPage>
    with TickerProviderStateMixin {
  AnimationController? _animation;

  Tween<double>? animationTween;

  @override
  void initState() {
    super.initState();
    final vmReference = ref.read(loadingPageVM);
    vmReference.milkDropController = AnimationController(
      value: -0.5,
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    vmReference.animationTween = Tween(begin: -1, end: 1)
      ..animate(vmReference.milkDropController!);

    vmReference.controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    vmReference.animation1 = Tween<double>(begin: 1.8, end: 2.2).animate(
        CurvedAnimation(
            parent: vmReference.controller1!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          vmReference.controller1!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          vmReference.controller1!.forward();
        }
      });

    vmReference.controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    vmReference.animation2 = Tween<double>(begin: 1.7, end: 2.5).animate(
        CurvedAnimation(
            parent: vmReference.controller2!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          vmReference.controller2!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          vmReference.controller2!.forward();
        }
      });

    vmReference.controller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    vmReference.animation3 = Tween<double>(begin: 1.7, end: 2.5).animate(
        CurvedAnimation(
            parent: vmReference.controller3!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          vmReference.controller3!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          vmReference.controller3!.forward();
        }
      });

    vmReference.controller4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    vmReference.animation4 = Tween<double>(begin: 1.8, end: 2.2).animate(
        CurvedAnimation(
            parent: vmReference.controller4!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          vmReference.controller4!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          vmReference.controller4!.forward();
        }
      });

    vmReference.initializeAnimationTimer();
  }

  @override
  void dispose() {
    try {
      // ref.read(loadingPageVM).cleanUp();
    } catch (e) {
      logger.e(e.toString());
    }
    super.dispose();
  }

  bool beginLiquidAnimation = false;

  @override
  Widget build(BuildContext context) {
    const double WIDTH = 170;
    final size = MediaQuery.sizeOf(context);
    final provider = ref.watch(loadingPageVM);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Stack(
          children: [
            TweenAnimationBuilder(
              tween: provider.animationTween!,
              duration: 5.seconds,
              onEnd: () {
                setState(() {
                  beginLiquidAnimation = true;
                });
                logger.i("Animation ended");
              },
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment(0 + (size.width / WIDTH) / 110, value),
                  child: SvgPicture.asset("assets/images/milk_drop.svg"),
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Text(
                  "Please wait while we gather your Baby's data...",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyThree.copyWith(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/baby_bottle.png",
                scale: 3,
              ),
            ),
            Align(
              // duration: 250.milliseconds,
              alignment:
                  // beginLiquidAnimation
                  //     ? Alignment.topCenter
                  //     :
                  Alignment.bottomCenter,
              child: SizedBox(
                // height: size.height,
                // width: size.width,
                child: CustomPaint(
                  painter: MyPainter(
                    // 2, 2, 2, 2,
                    beginLiquidAnimation
                        ? size.height
                        : provider.animation1!.value,
                    beginLiquidAnimation
                        ? size.height
                        : provider.animation2!.value,
                    beginLiquidAnimation
                        ? size.height
                        : provider.animation3!.value,
                    beginLiquidAnimation
                        ? size.height
                        : provider.animation4!.value,
                  ),
                  child: AnimatedContainer(
                    duration: 250.milliseconds,
                    onEnd: () {
                      ref.read(loadingPageVM).cleanUp();
                      context.goNamed(HomePage.routeIdentifier);
                    },
                    height:
                        beginLiquidAnimation ? size.height : size.height / 4,
                    width: size.width,

                    // color: Colors.green.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
