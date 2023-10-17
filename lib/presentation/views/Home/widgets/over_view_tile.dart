import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/styles/text_styles.dart';

import '../../../styles/app_colors.dart';

class OverViewTile extends ConsumerStatefulWidget {
  final String svgAssetPath;
  final String overViewTitle;
  final Color svgBackgroundColor;
  final String value;
  final String quickAnalysis;
  final Color quickAnalysisColor;
  const OverViewTile({
    super.key,
    required this.svgAssetPath,
    required this.svgBackgroundColor,
    required this.overViewTitle,
    required this.quickAnalysis,
    required this.quickAnalysisColor,
    required this.value,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OverViewTileState();
}

class _OverViewTileState extends ConsumerState<OverViewTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF132C84),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: widget.svgBackgroundColor,
                  child: SvgPicture.asset(
                    widget.svgAssetPath,
                    height: 15,
                    width: 15,
                  ),
                ),
                5.0.horizontalSpace(),
                Flexible(
                  child: Text(
                    widget.overViewTitle,
                    style: const TextStyle(
                      fontSize: 8.11,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                widget.value,
                style: AppTextStyle.headerThree.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              widget.quickAnalysis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: widget.quickAnalysisColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
