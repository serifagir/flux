import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/stats_page_components/bar_chart_component.dart';
import 'package:flux/provider/date_provider.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
              Tab(text: 'Yearly'),
            ],
          ),
          title: const Text('Stats'),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    DailyTimeController(),
                    DailyFluxChart(),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [WeeklyTimeController(), DailyFluxChart()],
                ),
              ),
              Center(
                child: Column(
                    // children: [MonthlyTimeController(), DailyFluxChart()],
                    ),
              ),
              Center(
                child: Column(
                    // children: [YearlyTimeController(), DailyFluxChart()],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyFluxChart extends StatefulWidget {
  const DailyFluxChart({
    super.key,
  });

  @override
  State<DailyFluxChart> createState() => _DailyFluxChartState();
}

class _DailyFluxChartState extends State<DailyFluxChart> {
  final controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.03),
            child: Card(
                surfaceTintColor: Theme.of(context).colorScheme.background,
                color: Theme.of(context).colorScheme.background,
                elevation: 5,
                child: PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.03),
                        child: BarChartSample3(),
                      );
                    }))));
  }
}

class DailyTimeController extends StatefulWidget {
  const DailyTimeController({
    super.key,
  });
  @override
  State<DailyTimeController> createState() => _DailyTimeControllerState();
}

class _DailyTimeControllerState extends State<DailyTimeController> {
  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    //todo: add functionality to change date
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            setState(() {
              dateProvider.decrementDate1Day();
            });
            print(dateProvider.date);
          },
        ),
        SizedBox(width: size.width * 0.1),
        Text(
          '${dateProvider.monthMap[dateProvider.date.month]} ${dateProvider.date.day}, ${dateProvider.date.year}',
        ),
        SizedBox(width: size.width * 0.1),
        IconButton(
          icon: const Icon(CupertinoIcons.forward),
          onPressed: () {
            setState(() {
              dateProvider.incrementDate1Day();
            });
            print(dateProvider.date);
          },
        ),
      ],
    );
  }
}

class WeeklyTimeController extends StatefulWidget {
  const WeeklyTimeController({
    super.key,
  });
  @override
  State<WeeklyTimeController> createState() => _WeeklyTimeControllerState();
}

class _WeeklyTimeControllerState extends State<WeeklyTimeController> {
  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    //todo: add functionality to change date
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            setState(() {
              dateProvider.decrementDate1Week();
            });
            print(dateProvider.date);
          },
        ),
        SizedBox(width: size.width * 0.1),
        Text(
          '${dateProvider.monthMap[dateProvider.date.month]} ${dateProvider.date.day}, ${dateProvider.date.year}',
        ),
        SizedBox(width: size.width * 0.1),
        IconButton(
          icon: const Icon(CupertinoIcons.forward),
          onPressed: () {
            setState(() {
              dateProvider.incrementDate1Day();
            });
            print(dateProvider.date);
          },
        ),
      ],
    );
  }
}
