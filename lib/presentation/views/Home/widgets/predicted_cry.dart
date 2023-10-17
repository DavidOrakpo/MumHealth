import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:template/core/Utilities/logger/logger.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/views/components/app_bottom_sheets.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/text_styles.dart';
import '../../components/primary_button.dart';

class PredictedCryTile extends ConsumerWidget {
  const PredictedCryTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: LayoutBuilder(
        builder: (context, predictedCryConstraints) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/baby_one.png",
                  height: predictedCryConstraints.maxHeight * 0.35,
                ),
                5.0.verticalSpace(),
                Text(
                  "Next Predicted Cry",
                  style: AppTextStyle.bodyThree.copyWith(
                    color: AppColors.white,
                    fontSize: 11,
                  ),
                ),
                5.0.verticalSpace(),
                Text(
                  "12:40 - 14:30",
                  style: AppTextStyle.bodyTwo.copyWith(
                    color: AppColors.accent,
                    fontSize: 21,
                  ),
                ),
                10.0.verticalSpace(),
                PrimaryButton(
                  onPressed: () async {
                    // if (Platform.isAndroid) {
                    //   const AndroidIntent intent = AndroidIntent(
                    //     action: 'android.intent.action.SET_ALARM',
                    //     // Add additional parameters if needed
                    //   );
                    //   try {
                    //     intent.launch();
                    //   } catch (e) {
                    //     logger.e(e.toString());
                    //   }
                    // }
                    await BottomSheets.alarmBottomSheet(
                        context: context, height: size.height * 0.95);
                  },
                  cornerRadius: 4,
                  backgroundColor: AppColors.primary.shade100,
                  height: 30,
                  text: "Set Alarm",
                  fontSize: 12,
                  textColor: const Color(0xFF2250C5),
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     "Set Alarm",
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
