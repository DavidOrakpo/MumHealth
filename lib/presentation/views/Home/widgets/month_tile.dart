import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/text_styles.dart';

class MonthTile extends ConsumerStatefulWidget {
  final String title;
  bool isSelected;
  final void Function()? onTap;
  MonthTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MonthTileState();
}

class _MonthTileState extends ConsumerState<MonthTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          width: 40,
          child: Text(
            widget.title,
            style: AppTextStyle.bodyOne.copyWith(
              color: widget.isSelected ? AppColors.primary : AppColors.textGray,
              fontSize: 17,
              fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
