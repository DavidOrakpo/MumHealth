import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:template/core/Extensions/extensions.dart';
import 'package:template/presentation/views/Home/viewModel/home_page_viewmodel.dart';

import '../../../styles/spacing.dart';
import 'day_of_the_week_tile.dart';

class WeekDayRowTile extends ConsumerStatefulWidget {
  const WeekDayRowTile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeekDayRowTileState();
}

class _WeekDayRowTileState extends ConsumerState<WeekDayRowTile> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homePageVM);
    return SizedBox(
      height: 85,
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: provider.selectedDate,
        builder: (context, selectedDateValue, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: provider.daysOfWeek.mapIndexed((index, element) {
              var isSelectedDay = selectedDateValue == element;
              return DayOfTheWeekTile(
                onTap: () {
                  provider.selectedDate.value = element;
                },
                isSelected: selectedDateValue == null
                    ? DateUtils.isSameDay(element, provider.todaysDate)
                    : isSelectedDay,
                weekDayTitle: DateFormat.EEEE().format(element).substring(0, 3),
                weekDayDate: element.day.toString(),
                isToday: DateUtils.isSameDay(element, provider.todaysDate),
              );
            }).toList(),
          ).padding(padding: AppSpacings.horizontalPadding);
        },
      ),
    );
  }
}
