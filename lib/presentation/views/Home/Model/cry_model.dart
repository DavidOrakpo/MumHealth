// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CryLevelModel {
  final double cryLevel;
  final DateTimeRange hourPeriod;
  CryLevelModel({
    required this.cryLevel,
    required this.hourPeriod,
  });

  @override
  String toString() =>
      'CryLevelModel(cryLevel: $cryLevel, hourPeriod: $hourPeriod)';
}
