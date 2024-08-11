import 'package:flutter/material.dart';
import '../../fl_chart/pie_chart/pie_chart_draw.dart';
import '../../fl_chart/bar_chart/bar_chart_draw.dart';
import 'package:share_kakeibo/main.dart';

class BudgetConfirmation extends StatefulWidget {
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
  }

  @override
  Widget build(BuildContext context) {
    // 円グラフ作成
    final screenWidth = MediaQuery.of(context).size.width;
    double radius = 50;
    num totalPrice = monthFoodPriceState +
        monthAssociatePriceState +
        monthDailyPriceState +
        monthHobbyPriceState +
        monthClothPriceState +
        monthTransPriceState +
        monthBeautyPriceState +
        monthSpecialPriceState +
        monthOtherPriceState;
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/confirmation.png'),
                        fit: BoxFit.cover)),
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
                  SizedBox(
                      width: screenWidth * 0.5,
                      child: PieChartDraw(
                          foodPrice: monthFoodPriceState,
                          associatePrice: monthAssociatePriceState,
                          dailyPrice: monthDailyPriceState,
                          hobbyPrice: monthHobbyPriceState,
                          clothPrice: monthClothPriceState,
                          transPrice: monthTransPriceState,
                          beautyPrice: monthBeautyPriceState,
                          specialPrice: monthSpecialPriceState,
                          otherPrice: monthOtherPriceState,
                          radius: radius)),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                      color: Colors.white.withOpacity(0.5),
                      child: BarChartDraw(
                        monthFoodPrice: monthFoodPriceState,
                        monthAssociatePrice: monthAssociatePriceState,
                        monthDailyPrice: monthDailyPriceState,
                        monthHobbyPrice: monthHobbyPriceState,
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
                      ))
                ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(isFromCalendar: false)));
              },
              child: const Icon(Icons.home),
            )));
  }
}
