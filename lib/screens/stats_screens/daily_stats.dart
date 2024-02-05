import 'package:flutter/material.dart';

class DailyStats extends StatefulWidget {
  const DailyStats({super.key});

  @override
  State<DailyStats> createState() => _DailyStatsState();
}

class _DailyStatsState extends State<DailyStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("Daily stats"),
    ));
  }
}
