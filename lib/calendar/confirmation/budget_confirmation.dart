import 'package:flutter/material.dart';
import '../../fl_chart/pie_chart/pie_chart_draw.dart';
import '../../fl_chart/bar_chart/bar_chart_draw.dart';
import 'package:share_kakeibo/main.dart';

class BudgetConfirmation extends StatefulWidget {
  // final String category;
  final num monthFoodPrice;
  final num monthAssociatePrice;
  final num monthDailyPrice;
  final num monthHobbyPrice;
  final num monthClothPrice;
  final num monthTransPrice;
  final num monthBeautyPrice;
  final num monthSpecialPrice;
  final num monthOtherPrice;
  final num lastMonthFoodPrice;
  final num lastMonthAssociatePrice;
  final num lastMonthDailyPrice;
  final num lastMonthHobbyPrice;
  final num lastMonthClothPrice;
  final num lastMonthTransPrice;
  final num lastMonthBeautyPrice;
  final num lastMonthSpecialPrice;
  final num lastMonthOtherPrice;
  final num ichiMonthFoodPrice;
  final num ichiMonthAssociatePrice;
  final num ichiMonthDailyPrice;
  final num ichiMonthHobbyPrice;
  final num ichiMonthClothPrice;
  final num ichiMonthTransPrice;
  final num ichiMonthBeautyPrice;
  final num ichiMonthSpecialPrice;
  final num ichiMonthOtherPrice;
  final num moeMonthFoodPrice;
  final num moeMonthAssociatePrice;
  final num moeMonthDailyPrice;
  final num moeMonthHobbyPrice;
  final num moeMonthClothPrice;
  final num moeMonthTransPrice;
  final num moeMonthBeautyPrice;
  final num moeMonthSpecialPrice;
  final num moeMonthOtherPrice;
  final int month;
  final int day;
  const BudgetConfirmation(
      {required this.monthFoodPrice,
      required this.monthAssociatePrice,
      required this.monthDailyPrice,
      required this.monthHobbyPrice,
      required this.monthClothPrice,
      required this.monthTransPrice,
      required this.monthBeautyPrice,
      required this.monthSpecialPrice,
      required this.monthOtherPrice,
      required this.lastMonthFoodPrice,
      required this.lastMonthAssociatePrice,
      required this.lastMonthDailyPrice,
      required this.lastMonthHobbyPrice,
      required this.lastMonthClothPrice,
      required this.lastMonthTransPrice,
      required this.lastMonthBeautyPrice,
      required this.lastMonthSpecialPrice,
      required this.lastMonthOtherPrice,
      required this.ichiMonthFoodPrice,
      required this.ichiMonthAssociatePrice,
      required this.ichiMonthDailyPrice,
      required this.ichiMonthHobbyPrice,
      required this.ichiMonthClothPrice,
      required this.ichiMonthTransPrice,
      required this.ichiMonthBeautyPrice,
      required this.ichiMonthSpecialPrice,
      required this.ichiMonthOtherPrice,
      required this.moeMonthFoodPrice,
      required this.moeMonthAssociatePrice,
      required this.moeMonthDailyPrice,
      required this.moeMonthHobbyPrice,
      required this.moeMonthClothPrice,
      required this.moeMonthTransPrice,
      required this.moeMonthBeautyPrice,
      required this.moeMonthSpecialPrice,
      required this.moeMonthOtherPrice,
      required this.month,
      required this.day,
      super.key});
  @override
  State<BudgetConfirmation> createState() => _BudgetConfirmationState();
}

class _BudgetConfirmationState extends State<BudgetConfirmation> {
  late num monthFoodPriceState;
  late num monthAssociatePriceState;
  late num monthDailyPriceState;
  late num monthHobbyPriceState;
  late num monthClothPriceState;
  late num monthTransPriceState;
  late num monthBeautyPriceState;
  late num monthSpecialPriceState;
  late num monthOtherPriceState;
  late num lastMonthFoodPriceState;
  late num lastMonthAssociatePriceState;
  late num lastMonthDailyPriceState;
  late num lastMonthHobbyPriceState;
  late num lastMonthClothPriceState;
  late num lastMonthTransPriceState;
  late num lastMonthBeautyPriceState;
  late num lastMonthSpecialPriceState;
  late num lastMonthOtherPriceState;
  late num ichiMonthFoodPriceState;
  late num ichiMonthAssociatePriceState;
  late num ichiMonthDailyPriceState;
  late num ichiMonthHobbyPriceState;
  late num ichiMonthClothPriceState;
  late num ichiMonthTransPriceState;
  late num ichiMonthBeautyPriceState;
  late num ichiMonthSpecialPriceState;
  late num ichiMonthOtherPriceState;
  late num moeMonthFoodPriceState;
  late num moeMonthAssociatePriceState;
  late num moeMonthDailyPriceState;
  late num moeMonthHobbyPriceState;
  late num moeMonthClothPriceState;
  late num moeMonthTransPriceState;
  late num moeMonthBeautyPriceState;
  late num moeMonthSpecialPriceState;
  late num moeMonthOtherPriceState;
  late num monthState;
  late num dayState;

  @override
  void initState() {
    super.initState();

    monthFoodPriceState = widget.monthFoodPrice;
    monthAssociatePriceState = widget.monthAssociatePrice;
    monthDailyPriceState = widget.monthDailyPrice;
    monthHobbyPriceState = widget.monthHobbyPrice;
    monthClothPriceState = widget.monthClothPrice;
    monthTransPriceState = widget.monthTransPrice;
    monthBeautyPriceState = widget.monthBeautyPrice;
    monthSpecialPriceState = widget.monthSpecialPrice;
    monthOtherPriceState = widget.monthOtherPrice;
    lastMonthFoodPriceState = widget.lastMonthFoodPrice;
    lastMonthAssociatePriceState = widget.lastMonthAssociatePrice;
    lastMonthDailyPriceState = widget.lastMonthDailyPrice;
    lastMonthHobbyPriceState = widget.lastMonthHobbyPrice;
    lastMonthClothPriceState = widget.lastMonthClothPrice;
    lastMonthTransPriceState = widget.lastMonthTransPrice;
    lastMonthBeautyPriceState = widget.lastMonthBeautyPrice;
    lastMonthSpecialPriceState = widget.lastMonthSpecialPrice;
    lastMonthOtherPriceState = widget.lastMonthOtherPrice;
    ichiMonthFoodPriceState = widget.ichiMonthFoodPrice;
    ichiMonthAssociatePriceState = widget.ichiMonthAssociatePrice;
    ichiMonthDailyPriceState = widget.ichiMonthDailyPrice;
    ichiMonthHobbyPriceState = widget.ichiMonthHobbyPrice;
    ichiMonthClothPriceState = widget.ichiMonthClothPrice;
    ichiMonthTransPriceState = widget.ichiMonthTransPrice;
    ichiMonthBeautyPriceState = widget.ichiMonthBeautyPrice;
    ichiMonthSpecialPriceState = widget.ichiMonthSpecialPrice;
    ichiMonthOtherPriceState = widget.ichiMonthOtherPrice;
    moeMonthFoodPriceState = widget.moeMonthFoodPrice;
    moeMonthAssociatePriceState = widget.moeMonthAssociatePrice;
    moeMonthDailyPriceState = widget.moeMonthDailyPrice;
    moeMonthHobbyPriceState = widget.moeMonthHobbyPrice;
    moeMonthClothPriceState = widget.moeMonthClothPrice;
    moeMonthTransPriceState = widget.moeMonthTransPrice;
    moeMonthBeautyPriceState = widget.moeMonthBeautyPrice;
    moeMonthSpecialPriceState = widget.moeMonthSpecialPrice;
    moeMonthOtherPriceState = widget.moeMonthOtherPrice;
    monthState = widget.month;
    dayState = widget.day;
  }

  @override
  Widget build(BuildContext context) {
    // 円グラフ作成
    final screenWidth = MediaQuery.of(context).size.width;
    double radius = 50;
    double personalRadius = 40;
    num totalPrice =
        monthFoodPriceState + monthAssociatePriceState + monthDailyPriceState +
        monthHobbyPriceState + monthClothPriceState + monthTransPriceState +
        monthBeautyPriceState + monthSpecialPriceState + monthOtherPriceState;
    num limitPrice = 40000 - totalPrice;
    String fightText = "";
    if (limitPrice > 30000) {
      fightText = "まだ余裕あるね ！";
    } else if (limitPrice > 20000) {
      fightText = "ちょっと節約した方がいいかも💦";
    } else if (limitPrice > 10000) {
      fightText = "あまり余裕ないから気を付けて ！";
    } else {
      fightText = "もう浪費しちゃダメだよ ！";
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/confirmation.png'), fit: BoxFit.cover)),
              child: Column(children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(children: [
                    Text(
                      "４万円まであと${limitPrice.toString()}円 ！",
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      fightText,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]))),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "${monthState.toString()}月の収支",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              SizedBox(
                  width: screenWidth * 0.5,
                  child: Column(children: [
                    const Text(
                      "いちくん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: ichiMonthFoodPriceState,
                        associatePrice: ichiMonthAssociatePriceState,
                        dailyPrice: ichiMonthDailyPriceState,
                        hobbyPrice: ichiMonthHobbyPriceState,
                        clothPrice: ichiMonthClothPriceState,
                        transPrice: ichiMonthTransPriceState,
                        beautyPrice: ichiMonthBeautyPriceState,
                        specialPrice: ichiMonthSpecialPriceState,
                        otherPrice: ichiMonthOtherPriceState,
                        radius: personalRadius)
                  ])),
              SizedBox(
                  width: screenWidth * 0.5,
                  child: Column(children: [
                    const Text(
                      "もえちゃん",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    PieChartDraw(
                        foodPrice: moeMonthFoodPriceState,
                        associatePrice: moeMonthAssociatePriceState,
                        dailyPrice: moeMonthDailyPriceState,
                        hobbyPrice: moeMonthHobbyPriceState,
                        clothPrice: moeMonthClothPriceState,
                        transPrice: moeMonthTransPriceState,
                        beautyPrice: moeMonthBeautyPriceState,
                        specialPrice: moeMonthSpecialPriceState,
                        otherPrice: moeMonthOtherPriceState,
                        radius: personalRadius)
                  ])),
            ],
          ),
          const Text(
            "ふたり",
            style: TextStyle(fontSize: 15),
          ),
          PieChartDraw(
              foodPrice: monthFoodPriceState,
              associatePrice: monthAssociatePriceState,
              dailyPrice: monthDailyPriceState,
              hobbyPrice: monthHobbyPriceState,
              clothPrice: monthClothPriceState,
              transPrice: monthTransPriceState,
              beautyPrice: monthBeautyPriceState,
              specialPrice: monthSpecialPriceState,
              otherPrice: monthOtherPriceState,
              radius: radius),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text("${monthState.toString()}月の前月比",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          BarChartDraw(
            monthFoodPrice: monthFoodPriceState,
            monthAssociatePrice: monthAssociatePriceState,
            monthDailyPrice: moeMonthDailyPriceState,
            monthHobbyPrice: moeMonthHobbyPriceState,
            monthClothPrice: monthClothPriceState,
            monthTransPrice: monthTransPriceState,
            monthBeautyPrice: monthBeautyPriceState,
            monthSpecialPrice: monthSpecialPriceState,
            monthOtherPrice: monthOtherPriceState,
            lastMonthFoodPrice: lastMonthFoodPriceState,
            lastMonthAssociatePrice: lastMonthAssociatePriceState,
            lastMonthDailyPrice: lastMonthDailyPriceState,
            lastMonthHobbyPrice: lastMonthHobbyPriceState,
            lastMonthClothPrice: lastMonthClothPriceState,
            lastMonthTransPrice: lastMonthTransPriceState,
            lastMonthBeautyPrice: lastMonthBeautyPriceState,
            lastMonthSpecialPrice: lastMonthSpecialPriceState,
            lastMonthOtherPrice: lastMonthOtherPriceState,
          )
        ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(isFromCalendar: false)));
              },
              child: const Icon(Icons.home),
            )));
  }
}
