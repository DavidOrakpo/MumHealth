import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/views/Home/viewModel/home_page_viewmodel.dart';

import 'month_tile.dart';

class MonthsRowTile extends ConsumerStatefulWidget {
  const MonthsRowTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MonthsRowTileState();
}

class _MonthsRowTileState extends ConsumerState<MonthsRowTile> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homePageVM);
    return SizedBox(
      height: 30,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: provider.selectedMonthDate,
          builder: (context, selectedMonthValue, child) {
            return ListView.separated(
              controller: provider.listOfMonthsScrollController,
              itemCount: provider.listOfMonthsDateTime.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (c, i) => 15.0.horizontalSpace(),
              itemBuilder: (context, index) {
                var item = provider.listOfMonthsDateTime[index];
                var itemString = DateFormat.MMM().format(item);
                var isSelectedMonth = selectedMonthValue == item;
                return MonthTile(
                  title: itemString,
                  isSelected: selectedMonthValue == null
                      ? DateUtils.isSameMonth(item, provider.todaysDate)
                      : isSelectedMonth,
                  onTap: () {
                    provider.selectedMonthDate.value = item;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
