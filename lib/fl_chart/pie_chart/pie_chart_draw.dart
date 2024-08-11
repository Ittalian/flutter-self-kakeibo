import 'package:flutter/material.dart';
import 'package:share_kakeibo/fl_chart/pie_chart/pie_chart_property.dart';
import 'pie_chart_section.dart';

class PieChartDraw extends StatelessWidget {
  final num foodPrice;
  final num associatePrice;
  final num dailyPrice;
  final num hobbyPrice;
  final num clothPrice;
  final num transPrice;
  final num beautyPrice;
  final num specialPrice;
  final num otherPrice;
  final double radius;
  const PieChartDraw(
      {required this.foodPrice,
      required this.associatePrice,
      required this.dailyPrice,
      required this.hobbyPrice,
      required this.clothPrice,
      required this.transPrice,
      required this.beautyPrice,
      required this.specialPrice,
      required this.otherPrice,
      required this.radius,
      super.key}
    );

  @override
  Widget build(BuildContext context) {

    // 選択肢が増えたらここに追加する
    List<PieChartProperty> pieChartPriceList = [
      PieChartProperty(
        foodPrice, '食費', Colors.red
      ),
      PieChartProperty(
        associatePrice, '交際費', const Color.fromARGB(255, 247, 1, 255).withOpacity(0.5)
      ),
      PieChartProperty(
        dailyPrice, '日用品', const Color(0xFFFDD609).withOpacity(0.5)
      ),
      PieChartProperty(
        hobbyPrice, '趣味費', const Color.fromARGB(255, 45, 6, 205).withOpacity(0.5)
      ),
      PieChartProperty(
        clothPrice, '被服費', const Color.fromARGB(255, 0, 149, 255).withOpacity(0.5)
      ),
      PieChartProperty(
        transPrice, '交通費', const Color.fromARGB(255, 6, 144, 6).withOpacity(0.5)
      ),
      PieChartProperty(
        beautyPrice, '美容費', const Color.fromARGB(255, 148, 70, 123).withOpacity(0.5)
      ),
      PieChartProperty(
        specialPrice, '特別費', const Color.fromARGB(255, 255, 140, 0).withOpacity(0.5)
      ),
      PieChartProperty(
        otherPrice, 'その他', const Color.fromARGB(255, 198, 116, 2).withOpacity(0.5)
      ),
    ];

    return PieChartSection(
        pieChartPropertyList: pieChartPriceList, radius: radius
      );
  }
}
