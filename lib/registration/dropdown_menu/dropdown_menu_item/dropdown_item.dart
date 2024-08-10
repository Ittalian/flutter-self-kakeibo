import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  final String category;
  final Color color;

  const DropdownItem({super.key, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 20,
        height: 20,
        color: color,
      ),
      const Padding(padding: EdgeInsets.only(left: 15)),
      Text(
        category,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ]);
  }
}
