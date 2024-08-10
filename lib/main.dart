import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'home/home.dart';
import 'registration/registration.dart';
import 'calendar/calendar.dart';
import 'buttom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting('ja_JP').then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(isFromCalendar: false),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isFromCalendar;
  const MyHomePage({required this.isFromCalendar, super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectIndex = 0;
  String price = "";

  final _pages = <Widget>[
    const Home(),
    const Registration(),
    const Calendar(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.isFromCalendar) {
      _selectIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pages[_selectIndex],
        bottomNavigationBar: ButtomNavigationBar(
            onTapItem: _onTapItem, selectIndex: _selectIndex),
            backgroundColor: Colors.white.withOpacity(0),);
  }
}
