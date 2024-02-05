import 'package:flutter/material.dart';

class YearlyStats extends StatefulWidget {
  const YearlyStats({super.key});

  @override
  State<YearlyStats> createState() => _YearlyStatsState();
}

class _YearlyStatsState extends State<YearlyStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text("Daily stats"),
    ));
  }
}
