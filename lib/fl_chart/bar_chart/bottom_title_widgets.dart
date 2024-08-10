import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BottomTitleWidgets extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  const BottomTitleWidgets(
      {required this.value, required this.meta, super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('食費', style: style);
        break;
      case 2:
        text = const Text('交際費', style: style);
        break;
      case 3:
        text = const Text('日用品', style: style);
        break;
      case 4:
        text = const Text('趣味費', style: style);
        break;
      case 5:
        text = const Text('被服費', style: style);
        break;
      case 6:
        text = const Text('交通費', style: style);
        break;
      case 7:
        text = const Text('美容費', style: style);
        break;
      case 8:
        text = const Text('特別費', style: style);
        break;
      case 9:
        text = const Text('その他', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
