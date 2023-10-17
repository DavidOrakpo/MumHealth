// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum OnboardingStates {
  FirstState(
    onboardingImage: "assets/images/baby_one_onboard.png",
    title: "Welcome to a New Mothering Experience",
    babyIconColorSet: [
      Color(0xFFFBF2E9),
      Color(0xFFE9EEFB),
      Color(0xFFF6C144),
      Color(0xFFE9EEFB),
    ],
    subTitle:
        "Now you can understand a lot about your new born, buckle up for an experience you will always long for.",
  ),
  SecondState(
    onboardingImage: "assets/images/baby_two_onboard.png",
    babyIconColorSet: [
      Color(0xFFE9EEFB),
      Color(0xFFFBF2E9),
      Color(0xFF4476F6),
      Color(0xFFFBF2E9),
    ],
    title: "A Cry with Meaning",
    subTitle:
        "Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.",
  ),
  ThirdState(
    onboardingImage: "assets/images/baby_three_onboard.png",
    title: "Analytical Insight",
    babyIconColorSet: [
      Color(0xFFFBF2E9),
      Color(0xFFE9EEFB),
      Color(0xFFF6C144),
      Color(0xFFE9EEFB),
    ],
    subTitle:
        "Be your baby's doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good decisions",
  ),
  FourthState(
    onboardingImage: "assets/images/baby_four_onboard.png",
    title: "Happy Mom\nHappy Home",
    babyIconColorSet: [
      Color(0xFFE9EEFB),
      Color(0xFFFBF2E9),
      Color(0xFF4476F6),
      Color(0xFFFBF2E9),
    ],
    subTitle:
        "Reduce your baby crying time whilst getting your schedule back together by planning for time of cry activity and time of quiet",
  );

  const OnboardingStates({
    required this.onboardingImage,
    required this.title,
    required this.subTitle,
    required this.babyIconColorSet,
  });
  final String onboardingImage;
  final String title;
  final List<Color> babyIconColorSet;
  final String subTitle;
}
