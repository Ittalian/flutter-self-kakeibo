import 'package:flutter/material.dart';

class UserDropdownItem extends StatelessWidget {
  final String name;

  const UserDropdownItem(
      {super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        name,
          style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ]);
  }
}
