import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Extensions/extensions.dart';

import '../../../styles/app_colors.dart';

class DayOfTheWeekTile extends ConsumerStatefulWidget {
  final String weekDayTitle;
  final String weekDayDate;
  final bool isToday;
  final void Function()? onTap;
  bool isSelected;
  DayOfTheWeekTile({
    super.key,
    required this.weekDayTitle,
    required this.weekDayDate,
    required this.isToday,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DayOfTheWeekTileState();
}

class _DayOfTheWeekTileState extends ConsumerState<DayOfTheWeekTile> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      isLabelVisible: widget.isToday,
      backgroundColor: AppColors.accent,
      smallSize: 12,
      // largeSize: 20,
      alignment: const Alignment(0, -1.1),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 38,
          decoration: BoxDecoration(
            color:
                widget.isSelected ? AppColors.primary : const Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(43),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.weekDayTitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: widget.isSelected
                        ? AppColors.white
                        : AppColors.textGray,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                15.0.verticalSpace(),
                Text(
                  widget.weekDayDate,
                  style: TextStyle(
                    fontSize: 17,
                    color: widget.isSelected
                        ? AppColors.white
                        : AppColors.textGray,
                    fontWeight:
                        widget.isSelected ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
