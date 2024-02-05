import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/screens/stats_screens/daily_stats.dart';
import 'package:flux/screens/stats_screens/monthly_stats.dart';
import 'package:flux/screens/stats_screens/weekly_starts.dart';
import 'package:flux/screens/stats_screens/yearly_stats.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('flux stats'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Daily",
              ),
              Tab(
                text: "Weekly",
              ),
              Tab(
                text: "Monthly",
              ),
              Tab(
                text: "Yearly",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            DailyStats(),
            WeeklyStats(),
            MonthlyStats(),
            YearlyStats(),
          ],
        ),
      ),
    );
  }
}
