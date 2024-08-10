import 'package:flutter/material.dart';
import 'dropdown_menu_item/dropdown_item.dart';

class DropdownButtonMenu extends StatefulWidget {
  final String currentCategory;
  final Function(String value) notifyParent;
  const DropdownButtonMenu(
      {super.key, required this.currentCategory, required this.notifyParent});

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String? isSelectedValue = '食費';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: '食費',
          child: DropdownItem(category: '食費', color: Colors.red)
        ),
        DropdownMenuItem(
          value: '交際費',
          child: DropdownItem(category: '交際費', color: Color.fromARGB(255, 247, 1, 255))
        ),
        DropdownMenuItem(
          value: '日用品',
          child: DropdownItem(category: '日用品', color: Color(0xFFFDD609))
        ),
        DropdownMenuItem(
          value: '趣味費',
          child: DropdownItem(category: '趣味費', color: Color.fromARGB(255, 45, 6, 205))
        ),
        DropdownMenuItem(
          value: '被服費',
          child: DropdownItem(category: '被服費', color: Color.fromARGB(255, 0, 149, 255))
        ),
        DropdownMenuItem(
          value: '交通費',
          child: DropdownItem(category: '交通費', color: Color.fromARGB(255, 6, 144, 6))
        ),
        DropdownMenuItem(
          value: '美容費',
          child: DropdownItem(category: '美容費', color: Color.fromARGB(255, 148, 70, 123))
        ),
        DropdownMenuItem(
          value: '特別費',
          child: DropdownItem(category: '特別費', color: Color.fromARGB(255, 255, 140, 0))
        ),
        DropdownMenuItem(
          value: 'その他',
          child: DropdownItem(category: 'その他', color: Color.fromARGB(255, 198, 116, 2))
        ),
      ],
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
        widget.notifyParent(value!);
      },
    );
  }
}
