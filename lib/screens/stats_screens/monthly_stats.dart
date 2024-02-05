import 'package:flutter/material.dart';

class MonthlyStats extends StatefulWidget {
  const MonthlyStats({super.key});

  @override
  State<MonthlyStats> createState() => _MonthlyStatsState();
}

class _MonthlyStatsState extends State<MonthlyStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("Daily stats"),
    ));
  }
}
