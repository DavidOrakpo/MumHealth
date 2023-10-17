import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/Utilities/logger/logger.dart';
import 'package:template/presentation/views/Home/Model/cry_model.dart';

import '../../../../core/Utilities/selectable/selection.dart';

final homePageVM = ChangeNotifierProvider((ref) => _HomePageViewModel());

class _HomePageViewModel with ChangeNotifier {
  List<DateTime> daysOfWeek = [];

  List<DateTime> listOfMonthsDateTime = List.generate(12, (index) {
    return DateTime(DateTime.now().year, index + 1);
  });

  /// Generates Mock Cry Data for the Bar Chart
  void populateMockData() {
    int cryModelIncrementor = 0;
    mockCryData = List.generate(12, (index) {
      var startDateTime =
          DateTime(2023, DateTime.now().month, 1, cryModelIncrementor);
      var endDateTime = startDateTime.copyWith(hour: cryModelIncrementor + 2);
      // cryModelIncrementor++;
      cryModelIncrementor = cryModelIncrementor + 2;
      return CryLevelModel(
        hourPeriod: DateTimeRange(
          start: startDateTime,
          end: endDateTime,
        ),
        cryLevel: index.toDouble(),
      );
    });
  }

  List<CryLevelModel> mockCryData = [];

  ScrollController listOfMonthsScrollController = ScrollController();

  List<SelectableItems<String>> listOfSelectableMonths = [];

  ValueNotifier<DateTime?> selectedMonthDate = ValueNotifier(null);

  ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);

  DateTime todaysDate = DateTime.now();

  DateTime? _closestSaturday;
  DateTime? get closestSaturday => _closestSaturday;

  set closestSaturday(DateTime? value) {
    _closestSaturday = value;
  }

  /// Computes the closest saturday based on today's date
  void _findSaturday() {
    if (todaysDate.weekday == DateTime.saturday) {
      _closestSaturday = todaysDate;

      return;
    }
    logger.i("Todays Date: $todaysDate");
    _closestSaturday = todaysDate
        .subtract(Duration(days: (todaysDate.weekday - DateTime.saturday) % 7));
    logger.i("Closest Saturday: $_closestSaturday");

    logger.i(_closestSaturday.toString());
  }

  /// Populates Days of the week based on teh closest Saturday
  void _populateDaysOfWeek() {
    daysOfWeek = List.generate(
        7, (index) => _closestSaturday!.add(Duration(days: index)));
  }

  /// Scrolls to the Currennt Month in the year
  void initializeScrollController() {
    var indexLocation = listOfMonthsDateTime
        .indexWhere((element) => element.month == todaysDate.month);
    listOfMonthsScrollController.jumpTo(indexLocation * 40);
  }

  /// Sets up the Home Page with Mock Data
  void initialize() {
    _findSaturday();
    _populateDaysOfWeek();
    populateMockData();
  }
}
