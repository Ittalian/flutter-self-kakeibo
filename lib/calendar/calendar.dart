import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_kakeibo/main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'confirmation/budget_confirmation.dart';
import '../price_list.dart';
import 'package:intl/intl.dart';
import 'loading_dialog.dart';
import 'dart:collection';

class Calendar extends HookWidget {
  const Calendar({super.key});

  PriceList setData(
      num foodPrice,
      num associatePrice,
      num dailyPrice,
      num hobbyPrice,
      num clothPrice,
      num transPrice,
      num beautyPrice,
      num specialPrice,
      num otherPrice,
      QuerySnapshot querySnapshot) {
    for (int index = 0; index < querySnapshot.docs.length; index++) {
      switch (querySnapshot.docs[index]["category"]) {
        case "食費":
          foodPrice += querySnapshot.docs[index]["price"];
          break;
        case "交際費":
          associatePrice += querySnapshot.docs[index]["price"];
          break;
        case "日用品":
          dailyPrice += querySnapshot.docs[index]["price"];
          break;
        case "趣味費":
          hobbyPrice += querySnapshot.docs[index]["price"];
          break;
        case "被服費":
          clothPrice += querySnapshot.docs[index]["price"];
          break;
        case "交通費":
          transPrice += querySnapshot.docs[index]["price"];
          break;
        case "美容費":
          beautyPrice += querySnapshot.docs[index]["price"];
          break;
        case "特別費":
          specialPrice += querySnapshot.docs[index]["price"];
          break;
        case "その他":
          otherPrice += querySnapshot.docs[index]["price"];
          break;
      }
    }
    return PriceList(foodPrice, associatePrice, dailyPrice, hobbyPrice,
        clothPrice, transPrice, beautyPrice, specialPrice, otherPrice);
  }

  DateTime getDatetime(String datetimeStr) {
    DateTime result;

    result = DateFormat("y年M月d日").parseStrict(datetimeStr);
    return result;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = useState(DateTime.now());
    num monthFoodPrice = 0;
    num monthAccociatePrice = 0;
    num monthDailyPrice = 0;
    num monthHobbyPrice = 0;
    num monthClothPrice = 0;
    num monthTransPrice = 0;
    num monthBeautyPrice = 0;
    num monthSpecialPrice = 0;
    num monthOtherPrice = 0;
    num lastMonthFoodPrice = 0;
    num lastMonthAssociatePrice = 0;
    num lastMonthDailyPrice = 0;
    num lastMonthHobbyPrice = 0;
    num lastMonthClothPrice = 0;
    num lastMonthTransPrice = 0;
    num lastMonthBeautyPrice = 0;
    num lastMonthSpecialPrice = 0;
    num lastMonthOtherPrice = 0;
    final oldEventsList = useState<Map<DateTime, List>>({});
    final newEventsList = useState<Map<DateTime, List>>({});
    final isAdded = useState(false);

    Map<DateTime, List> getEventsList(Map<DateTime, List> eventsList) {
      final snapshot = FirebaseFirestore.instance.collection("budget").where('user', isEqualTo: 'いちくん').get();
      snapshot.then((QuerySnapshot querySnapshot) {
        for (int i = 0; i < querySnapshot.docs.length; i++) {
          final dateValue = getDatetime(
              "${DateTime.now().year}年${querySnapshot.docs[i]['month']}月${querySnapshot.docs[i]['day']}日");
          if (eventsList[dateValue] == null) {
            eventsList[dateValue] = [
              "${querySnapshot.docs[i]['category']} ${querySnapshot.docs[i]['price']}円"
            ];
          } else if (isAdded.value == false) {
            eventsList[dateValue]!.add(
                "${querySnapshot.docs[i]['category']} ${querySnapshot.docs[i]['price']}円");
          }
        }
        isAdded.value = true;
        newEventsList.value = eventsList;
      });
      return newEventsList.value;
    }

    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(getEventsList(oldEventsList.value));

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/calendar.png'), fit: BoxFit.cover)),
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 30),
              color: Colors.white.withOpacity(0.5),
              child: TableCalendar(
                firstDay: DateTime.utc(DateTime.now().year, 1, 1),
                lastDay: DateTime.utc(DateTime.now().year + 100, 12, 31),
                focusedDay: focusedDayState.value,
                locale: 'ja_JP',
                eventLoader: getEventForDay,
                headerStyle: const HeaderStyle(formatButtonVisible: false),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDayState.value, day);
                },
                onDayLongPressed: (selectedDay, focusedDay) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text("今月の収支を見ますか？"),
                        actions: <Widget>[
                          TextButton(
                              child: const Text("見る"),
                              onPressed: () async {
                                await LoadingDialog.show(context);
                                try {
                                  //  データ取得処理
                                  await FirebaseFirestore.instance
                                      .collection('budget')
                                      .where('user', isEqualTo: 'いちくん')
                                      .where('year',
                                          isEqualTo: DateTime.now().year)
                                      .where('month',
                                          isEqualTo:
                                              selectedDayState.value.month)
                                      .get()
                                      .then((QuerySnapshot querySnapshot) {
                                    PriceList monthPriceList = setData(
                                        monthFoodPrice,
                                        monthAccociatePrice,
                                        monthDailyPrice,
                                        monthHobbyPrice,
                                        monthClothPrice,
                                        monthTransPrice,
                                        monthBeautyPrice,
                                        monthSpecialPrice,
                                        monthOtherPrice,
                                        querySnapshot);
                                    monthFoodPrice = monthPriceList.foodPrice;
                                    monthAccociatePrice =
                                        monthPriceList.associatePrice;
                                    monthDailyPrice = monthPriceList.dailyPrice;
                                    monthHobbyPrice = monthPriceList.hobbyPrice;
                                    monthClothPrice = monthPriceList.clothPrice;
                                    monthTransPrice = monthPriceList.transPrice;
                                    monthBeautyPrice =
                                        monthPriceList.beautyPrice;
                                    monthSpecialPrice =
                                        monthPriceList.specialPrice;
                                    monthOtherPrice = monthPriceList.otherPrice;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('budget')
                                      .where('user', isEqualTo: 'いちくん')
                                      .where('year',
                                          isEqualTo: DateTime.now().year)
                                      .where('month',
                                          isEqualTo:
                                              selectedDayState.value.month - 1)
                                      .get()
                                      .then((QuerySnapshot querySnapshot) {
                                    PriceList lastMonthPriceList = setData(
                                        lastMonthFoodPrice,
                                        lastMonthAssociatePrice,
                                        lastMonthDailyPrice,
                                        lastMonthHobbyPrice,
                                        lastMonthClothPrice,
                                        lastMonthTransPrice,
                                        lastMonthBeautyPrice,
                                        lastMonthSpecialPrice,
                                        lastMonthTransPrice,
                                        querySnapshot);
                                    lastMonthFoodPrice =
                                        lastMonthPriceList.foodPrice;
                                    lastMonthAssociatePrice =
                                        lastMonthPriceList.associatePrice;
                                    lastMonthDailyPrice =
                                        lastMonthPriceList.dailyPrice;
                                    lastMonthHobbyPrice =
                                        lastMonthPriceList.hobbyPrice;
                                    lastMonthClothPrice =
                                        lastMonthPriceList.clothPrice;
                                    lastMonthTransPrice =
                                        lastMonthPriceList.transPrice;
                                    lastMonthBeautyPrice =
                                        lastMonthPriceList.beautyPrice;
                                    lastMonthSpecialPrice =
                                        lastMonthPriceList.specialPrice;
                                    lastMonthOtherPrice =
                                        lastMonthPriceList.otherPrice;
                                  });
                                } finally {
                                  await LoadingDialog.hide(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BudgetConfirmation(
                                                  monthFoodPrice:
                                                      monthFoodPrice,
                                                  monthAssociatePrice:
                                                      monthAccociatePrice,
                                                  monthDailyPrice:
                                                      monthDailyPrice,
                                                  monthHobbyPrice:
                                                      monthHobbyPrice,
                                                  monthClothPrice:
                                                      monthClothPrice,
                                                  monthTransPrice:
                                                      monthTransPrice,
                                                  monthBeautyPrice:
                                                      monthBeautyPrice,
                                                  monthSpecialPrice:
                                                      monthSpecialPrice,
                                                  monthOtherPrice:
                                                      monthOtherPrice,
                                                  lastMonthFoodPrice:
                                                      lastMonthFoodPrice,
                                                  lastMonthAssociatePrice:
                                                      lastMonthAssociatePrice,
                                                  lastMonthDailyPrice:
                                                      lastMonthDailyPrice,
                                                  lastMonthHobbyPrice:
                                                      lastMonthHobbyPrice,
                                                  lastMonthClothPrice:
                                                      lastMonthClothPrice,
                                                  lastMonthTransPrice:
                                                      lastMonthTransPrice,
                                                  lastMonthBeautyPrice:
                                                      lastMonthBeautyPrice,
                                                  lastMonthSpecialPrice:
                                                      lastMonthSpecialPrice,
                                                  lastMonthOtherPrice:
                                                      lastMonthOtherPrice,
                                                      )));
                                }
                              }),
                          TextButton(
                              child: const Text("やっぱやめる"),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      );
                    },
                  );
                },
                onDaySelected: (selectedDay, focusedDay) {
                  selectedDayState.value = selectedDay;
                  focusedDayState.value = focusedDay;
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < events.length; i++)
                            if (i < 3)
                              const Text(
                                "🌟",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              )
                            else if (i == 3)
                              const Padding(
                                  padding: EdgeInsets.only(left: 3),
                                  child: Text(
                                    "...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ))
                        ]);
                  },
                ),
              )),
          ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: getEventForDay(selectedDayState.value)
                  .map((event) => Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(children: [
                        Expanded(
                            child: SizedBox(
                                width: screenWidth * 0.8,
                                child: ListTile(
                                  title: Text(event.toString()),
                                ))),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: const Text("削除しますか？"),
                                    actions: <Widget>[
                                      TextButton(
                                          child: const Text("する"),
                                          onPressed: () async {
                                            List<String> deleteData =
                                                event.split(" ");
                                            num deletePrice = num.parse(
                                                deleteData[
                                                        deleteData.length - 1]
                                                    .replaceAll("円", ""));
                                            final query =
                                                await FirebaseFirestore.instance
                                                    .collection("budget")
                                                    .where('year',
                                                        isEqualTo:
                                                            selectedDayState
                                                                .value.year)
                                                    .where('month',
                                                        isEqualTo:
                                                            selectedDayState
                                                                .value.month)
                                                    .where('day',
                                                        isEqualTo:
                                                            selectedDayState
                                                                .value.day)
                                                    .where('user',
                                                        isEqualTo:
                                                            deleteData[0])
                                                    .where('category',
                                                        isEqualTo:
                                                            deleteData[1])
                                                    .where('price',
                                                        isEqualTo: deletePrice)
                                                    .get();
                                            query.docs[0].reference.delete();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MyHomePage(
                                                            isFromCalendar:
                                                                true)));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: const Text('削除しました'),
                                              action: SnackBarAction(
                                                label: 'OK',
                                                onPressed: () {},
                                              ),
                                            ));
                                          }),
                                      TextButton(
                                          child: const Text("やっぱやめる"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text("削除")),
                            const Padding(padding: EdgeInsets.only(right: 10))
                      ])))
                  .toList()),
        ]));
  }
}
