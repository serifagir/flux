import 'package:flutter/material.dart';

class WeeklyStats extends StatefulWidget {
  const WeeklyStats({super.key});

  @override
  State<WeeklyStats> createState() => _WeeklyStatsState();
}

class _WeeklyStatsState extends State<WeeklyStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("Daily stats"),
    ));
  }
}
