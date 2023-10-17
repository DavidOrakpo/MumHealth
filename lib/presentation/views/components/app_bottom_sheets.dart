import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/app_colors.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/components/primary_button.dart';

class BottomSheets {
  static Future<void> alarmBottomSheet({
    required BuildContext context,
    required double height,
  }) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      // barrierColor: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.gray.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 24, right: 24, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        "Cancel",
                        style: AppTextStyle.bodyThree.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                    Text(
                      "Edit Alarm",
                      style: AppTextStyle.bodyThree.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Save",
                      style: AppTextStyle.bodyThree.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                20.0.verticalSpace(),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      brightness: Brightness.dark,
                    ),
                    child: CupertinoDatePicker(
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime value) {},
                    ),
                  ),
                ),
                15.0.verticalSpace(),
                Container(
                  // height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFF484848),
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  padding: AppSpacings.allPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Repeat",
                            style: AppTextStyle.bodyThree.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Never",
                                style: AppTextStyle.bodyThree.copyWith(
                                  color: AppColors.gray.shade400,
                                  fontSize: 15,
                                  height: 1,
                                ),
                              ),
                              5.0.horizontalSpace(),
                              Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  color: AppColors.gray.shade400,
                                  size: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: AppColors.textGray,
                      ).padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Label",
                            style: AppTextStyle.bodyThree.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Alarm",
                                style: AppTextStyle.bodyThree.copyWith(
                                  color: AppColors.gray.shade400,
                                  fontSize: 15,
                                  height: 1,
                                ),
                              ),
                              5.0.horizontalSpace(),
                              Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  color: AppColors.gray.shade400,
                                  size: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: AppColors.textGray,
                      ).padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sound",
                            style: AppTextStyle.bodyThree.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Circuit",
                                style: AppTextStyle.bodyThree.copyWith(
                                  color: AppColors.gray.shade400,
                                  fontSize: 15,
                                  height: 1,
                                ),
                              ),
                              5.0.horizontalSpace(),
                              Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  color: AppColors.gray.shade400,
                                  size: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: AppColors.textGray,
                      ).padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Snooze",
                            style: AppTextStyle.bodyThree.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            child: CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                25.0.verticalSpace(),
                PrimaryButton(
                  text: "Delete Alarm",
                  width: double.infinity,
                  onPressed: () {
                    context.pop();
                  },
                  backgroundColor: const Color(0xFF484848),
                  cornerRadius: 10,
                  fontSize: 15,
                  fontweight: FontWeight.bold,
                  textColor: AppColors.errorColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
