import 'package:flutter/material.dart';

class ButtomNavigationBar extends StatefulWidget {
  final Function(int index) onTapItem;
  final int selectIndex;
  const ButtomNavigationBar(
      {required this.onTapItem, required this.selectIndex, super.key});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: '収支登録'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'カレンダー'),
      ],
      currentIndex: widget.selectIndex,
      onTap: widget.onTapItem,
      type: BottomNavigationBarType.fixed,
    );
  }
}
