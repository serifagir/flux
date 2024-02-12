import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flux/provider/stats_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyStats extends StatefulWidget {
  const DailyStats({super.key});

  @override
  State<DailyStats> createState() => _DailyStatsState();
}

class _DailyStatsState extends State<DailyStats> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "Feb 5, 2024",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            IconButton(
              icon: const Icon(
                Icons.chevron_right,
                size: 40,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Card(
          elevation: 5,
          child: SizedBox(
            height: size.height * 0.7,
            width: size.width * 0.9,
            child: const DailyFluxChart(),
          ),
        )
      ],
    );
  }
}

class DailyFluxChart extends StatefulWidget {
  const DailyFluxChart({super.key});

  @override
  State<DailyFluxChart> createState() => _DailyFluxChartState();
}

class _DailyFluxChartState extends State<DailyFluxChart> {
  final DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 4,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 4:
        text = '4';
        break;
      case 8:
        text = '8';
        break;
      case 12:
        text = '12';
        break;
      case 16:
        text = '16';
        break;
      case 20:
        text = '20';
        break;
      case 24:
        text = '24';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.blue,
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[0]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[1]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[2]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[3]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[4]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[5]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[6]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[7]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[8]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[9]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[10]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[11]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 12,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[12]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 13,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[13]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 14,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[14]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 15,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[15]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 16,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[16]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 17,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[17]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 18,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[18]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 19,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[19]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 20,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[20]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 21,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[21]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 22,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[22]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 23,
          barRods: [
            BarChartRodData(
              toY: StatsProvider()
                  .handleDailyFluxStats(currentDate)[23]!
                  .toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: DailyFluxChart(),
    );
  }
}
