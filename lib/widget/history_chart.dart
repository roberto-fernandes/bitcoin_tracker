import 'package:bitcoin_tracker/model/historical_price.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

const List<Color> gradientColors = [
  Colors.orange,
  Colors.yellow,
];

class HistoryChart extends StatelessWidget {
  final HistoricalPrice data;

  HistoryChart(this.data);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      getDataChart(),
    );
  }

  LineChartData getDataChart() {
    var bpi = data.bpi;
    List<double> _valuesList = [];
    bpi.forEach((key, value) => _valuesList.add(value));

    return LineChartData(
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              margin: 8,
              getTextStyles: (value) =>
                  const TextStyle(color: Colors.white, fontSize: 12),
              getTitles: (index) {
                String key = bpi.keys.elementAt(index.toInt());
                return index == 0 ||
                        index == bpi.length ~/ 2 ||
                        index == bpi.length - 1
                    ? key
                    : "";
              }),
          leftTitles: SideTitles(
              showTitles: true,
              interval: 2000,
              getTextStyles: (value) => TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
              reservedSize: 40,
              margin: 8,
              getTitles: (value) {
                return '\$${value.toInt()}';
              }),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 0,
        maxX: bpi.length.toDouble() - 1,
        minY: _valuesList.reduce(min) * 0.95,
        maxY: _valuesList.reduce(max) * 1.05,
        lineBarsData: [
          LineChartBarData(
            spots: _getBarSpots(_valuesList),
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((colors) => colors.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ]);
  }

  List<FlSpot> _getBarSpots(List<double> values) {
    List<FlSpot> flSpotList = [];

    for (int i = 0; i < values.length; i++) {
      flSpotList.add(FlSpot(i.toDouble(), values[i]));
    }

    return flSpotList;
  }
}
