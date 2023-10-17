import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/core/Utilities/selectable/selection.dart';
import 'package:template/presentation/styles/spacing.dart';
import 'package:template/presentation/styles/text_styles.dart';
import 'package:template/presentation/views/Home/viewModel/home_page_viewmodel.dart';
import 'package:template/presentation/views/Home/widgets/bar_chart_tile.dart';
import 'package:template/presentation/views/Home/widgets/daily_challenge.dart';
import 'package:template/presentation/views/Home/widgets/day_of_the_week_tile.dart';
import 'package:template/presentation/views/Home/widgets/month_tile.dart';
import 'package:template/presentation/views/Home/widgets/months_tile.dart';
import 'package:template/presentation/views/Home/widgets/over_view_row_tile.dart';
import 'package:template/presentation/views/Home/widgets/over_view_tile.dart';
import 'package:template/presentation/views/Home/widgets/predicted_cry.dart';
import 'package:template/presentation/views/Home/widgets/week_day_tile.dart';
import 'package:template/presentation/views/components/primary_button.dart';

import '../../styles/app_colors.dart';

class HomePage extends ConsumerStatefulWidget {
  static const routeIdentifier = "HOME_PAGE";
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  ScrollController monthScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(homePageVM).initialize();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homePageVM).initializeScrollController();
      // var indexLocation = ref.read(homePageVM).listOfMonthsDateTime.indexWhere(
      //     (element) => element.month == ref.read(homePageVM).todaysDate.month);
      // monthScrollController.jumpTo(indexLocation * 40);
    });
  }

  @override
  void dispose() {
    ref.watch(homePageVM).listOfMonthsScrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homePageVM);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        // automaticallyImplyLeading: true,
        leadingWidth: 50,
        centerTitle: true,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
          ),
        ),
        actions: [
          Container(
            width: 50,
            // color: Colors.green,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Badge(
                isLabelVisible: true,
                backgroundColor: AppColors.accent,
                smallSize: 8,
                largeSize: 20,
                alignment: const Alignment(0.6, -1),
                child: SvgPicture.asset(
                  "assets/icons/notification.svg",
                ),
              ),
            ),
          ),
        ],
        title: Text(
          "Cry Records",
          style: AppTextStyle.headerFour.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MonthsRowTile(),
          14.0.verticalSpace(),
          const WeekDayRowTile(),
          24.0.verticalSpace(),
          Text(
            "Today's Overview",
            style: AppTextStyle.bodyThree.copyWith(
              color: AppColors.gray.shade200,
            ),
          ).padding(padding: AppSpacings.horizontalPadding),
          14.0.verticalSpace(),
          const OverViewRowTile(),
          20.0.verticalSpace(),
          Text(
            "Hourly Breakdown",
            style: AppTextStyle.bodyThree.copyWith(
              color: AppColors.gray.shade200,
            ),
          ).padding(padding: AppSpacings.horizontalPadding),
          10.0.verticalSpace(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    BarChartTile(height: constraints.maxHeight * 0.5),
                    Expanded(
                      child: Row(
                        children: [
                          const DailyChallengeTile(),
                          15.0.horizontalSpace(),
                          const PredictedCryTile()
                        ],
                      ).padding(
                          padding: AppSpacings.horizontalPadding
                              .copyWith(top: 10, bottom: 10)),
                    )
                  ],
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
