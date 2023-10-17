import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:template/presentation/views/Home/viewModel/home_page_viewmodel.dart';

import '../../../styles/app_colors.dart';

class BarChartTile extends ConsumerStatefulWidget {
  double? height;
  BarChartTile({
    super.key,
    required this.height,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BarChartTileState();
}

class _BarChartTileState extends ConsumerState<BarChartTile> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homePageVM);
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 12,
      ),
      decoration: const BoxDecoration(
        // color: Colors.blue,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
          colors: [
            Color(0xFF4476F6),
            Color(0xFF07236B),
          ],
        ),
      ),
      child: Center(
        child: BarChart(
          BarChartData(
            minY: 0,
            maxY: 13,
            gridData: const FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            titlesData: FlTitlesData(
                show: true,
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    var mockCryItem = provider.mockCryData[value.toInt()];
                    const style = TextStyle(
                      color: AppColors.white,
                      fontSize: 8,
                    );

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      // angle: 20,
                      space: 10,
                      fitInside: const SideTitleFitInsideData(
                        enabled: false,
                        distanceFromEdge: 0,
                        parentAxisSize: 0,
                        axisPosition: 0,
                      ),
                      child: Text(
                        switch (value.toInt()) {
                          0 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          1 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          2 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          3 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          4 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          5 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          6 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          7 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          8 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          9 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          10 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          11 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          12 =>
                            "${DateFormat.Hm().format(mockCryItem.hourPeriod.start)}/\n${DateFormat.Hm().format(mockCryItem.hourPeriod.end)}",
                          _ => "w",
                        },
                        maxLines: 2,
                        style: style,
                      ),
                    );
                  },
                ))),
            barGroups: provider.mockCryData.mapIndexed((index, element) {
              return BarChartGroupData(
                x: index,
                // barsSpace: 5,
                barRods: [
                  BarChartRodData(
                    toY: element.cryLevel,
                    color: AppColors.white,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 13,
                      color: const Color.fromRGBO(3, 35, 112, 0.33),
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
