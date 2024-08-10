import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bar_chart_property.dart';
import 'bottom_title_widgets.dart';

class BarChartSection extends StatelessWidget {
  final List<BarChartPropery> barChartPropertyList;
  final double x;
  const BarChartSection({
    required this.barChartPropertyList,
    required this.x,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          ),
        ),
        titlesData: FlTitlesData(
            topTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              interval: 1.0,
              reservedSize: 42.0,
              getTitlesWidget: (value, meta) =>
                  BottomTitleWidgets(value: value, meta: meta),
            ))),
        groupsSpace: 10,
        barGroups: [
          for (int i = 0; i < barChartPropertyList.length; i++)
              BarChartGroupData(x: (i + x).toInt(), barRods: [
                BarChartRodData(
                    toY: barChartPropertyList[i].lastMonthPrice.toDouble(),
                    width: 15,
                    color: barChartPropertyList[i].color),
                BarChartRodData(
                    toY: barChartPropertyList[i].price.toDouble(),
                    width: 15,
                    color: barChartPropertyList[i].color),
              ])
        ],
      ),
    );
  }
}
