import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Extensions/extensions.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/spacing.dart';
import 'over_view_tile.dart';

class OverViewRowTile extends ConsumerStatefulWidget {
  const OverViewRowTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OverViewRowTileState();
}

class _OverViewRowTileState extends ConsumerState<OverViewRowTile> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        OverViewTile(
          svgAssetPath: "assets/icons/sun-fog.svg",
          svgBackgroundColor: Color(0xFFD5E0FE),
          overViewTitle: "Number of Cry Episode",
          value: "45",
          quickAnalysis: "20% better than yesterday",
          quickAnalysisColor: Color(0xFF14833D),
        ),
        Spacer(),
        OverViewTile(
          svgAssetPath: "assets/icons/wifi-square.svg",
          svgBackgroundColor: Color(0xFFFEF5D5),
          overViewTitle: "Longest Cry Duration",
          value: "30mins",
          quickAnalysis: "20% worst than yesterday",
          quickAnalysisColor: AppColors.errorColor,
        ),
        Spacer(),
        OverViewTile(
          svgAssetPath: "assets/icons/chart.svg",
          svgBackgroundColor: Color(0xFFECD5FE),
          overViewTitle: "Cumulative Cry Duration",
          value: "4hours",
          quickAnalysis: "20% better than yesterday",
          quickAnalysisColor: Color(0xFF14833D),
        ),
      ],
    ).padding(padding: AppSpacings.horizontalPadding);
  }
}
