import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FluxNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: "Day",
              ),
              Tab(
                text: "Week",
              ),
              Tab(
                text: "Month",
              ),
              Tab(
                text: "Year",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            //---------------------------- Day ---------------------------- //
            Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Flux ${index + 1}"),
                      subtitle: Text(
                          "Completed on ${notifier.completedFluxes[index].completedDate}"),
                      trailing: Text(
                          "${notifier.completedFluxes[index].seconds} seconds"),
                    ),
                  );
                },
              ),
            ),

            //---------------------------- Week ---------------------------- //
            Center(
              child: Text("It's rainy here"),
            ),
            //---------------------------- Month --------------------------- //
            Center(
              child: Text("It's sunny here"),
            ),
            //---------------------------- Year ---------------------------- //
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
