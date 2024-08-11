import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dropdown_menu/dropdown_button_menu.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final priceController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  int price = 0;
  String category = "食費";
  int month = 0;
  int day = 0;
  final formKey = GlobalKey<FormState>();

  void setCategory(String value) {
    setState(() {
      category = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/registration.png'),
                    fit: BoxFit.cover)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(50, 250, 50, 0),
                  child: TextFormField(
                    controller: priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してね';
                      } else if (RegExp(r'[^0-9]').hasMatch(value)) {
                        return '0以上の整数だよ';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.currency_yen),
                      hintText: '10000',
                      labelText: '金額',
                    ),
                    onChanged: (value) {
                      setState(() {
                        price = int.parse(value);
                      });
                    },
                    keyboardType: TextInputType.number,
                  )),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '項目',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 50),
                        DropdownButtonMenu(
                          currentCategory: category,
                          notifyParent: setCategory,
                        ),
                      ])),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(children: [
                    Flexible(
                        child: TextFormField(
                      controller: monthController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '入力してね';
                        } else if (RegExp(r'[^0-9]').hasMatch(value) ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 12) {
                          return '1～12だよ';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.nightlight),
                        hintText: '7',
                      ),
                      onChanged: (value) {
                        setState(() {
                          month = int.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                    )),
                    const Text("月", style: TextStyle(fontSize: 20)),
                    const Padding(padding: EdgeInsets.only(left: 50)),
                    Flexible(
                        child: TextFormField(
                      controller: dayController,
                      validator: (value) {
                        int validDay =
                            DateTime(DateTime.now().year, month + 1, 1)
                                .add(const Duration(days: -1))
                                .day;
                        if (value == null || value.isEmpty) {
                          return '入力してね';
                        } else if (RegExp(r'[^0-9]').hasMatch(value) ||
                            int.parse(value) < 1 ||
                            validDay < int.parse(value)) {
                          return '1～${validDay}だよ';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.wb_sunny),
                        hintText: '1',
                      ),
                      onChanged: (value) {
                        setState(() {
                          day = int.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                    )),
                    const Text("日",
                        style: TextStyle(
                          fontSize: 20,
                        ))
                  ])),
              const Padding(padding: EdgeInsets.only(top: 45)),
              ElevatedButton.icon(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text("登録しますか？"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () async {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('登録しました'),
                                    action: SnackBarAction(
                                      label: 'OK',
                                      onPressed: () {},
                                    ),
                                  ));
                                  Navigator.pop(context);
                                  // データ追加処理
                                  await FirebaseFirestore.instance
                                      .collection('budget')
                                      .add({
                                    'price': price,
                                    'category': category,
                                    'year': DateTime.now().year,
                                    'month': month,
                                    'day': day,
                                    'user': 'いちくん',
                                  });
                                  priceController.clear();
                                  monthController.clear();
                                  dayController.clear();
                                },
                                child: const Text("する")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("やっぱやめる"))
                          ],
                        );
                      },
                    );
                  }
                },
                icon: const Icon(
                  Icons.pan_tool_alt,
                  color: Color.fromARGB(255, 0, 30, 255),
                ),
                label: const Text(
                  '登録',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 30, 255),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 167, 215, 254),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ])));
  }
}
