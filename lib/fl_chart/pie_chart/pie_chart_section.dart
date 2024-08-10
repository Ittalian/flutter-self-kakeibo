import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'pie_chart_property.dart';

class PieChartSection extends StatelessWidget {
  final List<PieChartProperty> pieChartPropertyList;
  final double radius;
  const PieChartSection(
      {required this.pieChartPropertyList, required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    num totalPrice = 0;
    for (final pieChartProperty in pieChartPropertyList) {
      totalPrice += pieChartProperty.price;
    }
    if (totalPrice == 0) {
      // 0で割ることを防ぐ
      totalPrice = 1;
      return const Column(children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Text(
          "収支はありません",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 50)),
      ]);
    }
    return SizedBox(
        height: 250,
        child: PieChart(PieChartData(
            startDegreeOffset: 270,
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: [
              for (final pieChartProperty in pieChartPropertyList)
                PieChartSectionData(
                  color: pieChartProperty.color,
                  value: pieChartProperty.price / totalPrice * 130,
                  title: '${pieChartProperty.caterogy}\n${pieChartProperty.price.toString()}',
                  radius: radius,
                  titleStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
            ]
          ))
        );
  }
}
