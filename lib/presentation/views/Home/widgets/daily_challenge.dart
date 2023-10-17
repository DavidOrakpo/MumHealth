import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/Extensions/extensions.dart';

import '../../../styles/app_colors.dart';

class DailyChallengeTile extends ConsumerWidget {
  const DailyChallengeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(14).copyWith(
            // bottom: 0,
            ),
        // color: Colors.blue,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.gray.shade300,
              width: 0.5,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: const Color(0xFFFBE6B5),
                  child: SvgPicture.asset(
                    "assets/icons/star.svg",
                    height: 15,
                    width: 15,
                  ),
                ),
                5.0.horizontalSpace(),
                const Flexible(
                  child: Text(
                    "Daily Challenge",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            5.0.verticalSpace(),
            Expanded(
              child: LayoutBuilder(
                builder: (
                  context,
                  dailyChallengeConstraints,
                ) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          // padding: const EdgeInsets
                          //         .symmetric(
                          //     horizontal: 24,
                          //     vertical: 10),
                          // color: Colors.green,
                          height: dailyChallengeConstraints.maxHeight * 0.85,
                          width: dailyChallengeConstraints.maxHeight * 0.85,
                          // width: 70,
                          child: const CircularProgressIndicator(
                            strokeWidth: 20,
                            color: Color(0xFFDEA00F),
                            value: 0.6,
                          ),
                        ),
                        Container(
                          height: dailyChallengeConstraints.maxHeight * 0.73,
                          width: dailyChallengeConstraints.maxHeight * 0.73,
                          // width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gray.shade300.withOpacity(0.4),
                                blurRadius: 10,
                                spreadRadius: 4,
                              )
                            ],
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "8\n",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "out of 12\n hours of silence",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 6,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
