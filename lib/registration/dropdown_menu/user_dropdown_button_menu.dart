import 'package:flutter/material.dart';
import 'dropdown_menu_item/user_dropdown_item.dart';

class UserDropdownButtonMenu extends StatefulWidget {
  final String currentUser;
  final Function(String value) notifyParent;
  const UserDropdownButtonMenu(
      {super.key, required this.currentUser, required this.notifyParent});

  @override
  State<UserDropdownButtonMenu> createState() => _UserDropdownButtonMenuState();
}

class _UserDropdownButtonMenuState extends State<UserDropdownButtonMenu> {
  String? isSelectedValue = 'いちくん';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 'いちくん',
          child: UserDropdownItem(name: 'いちくん')
        ),
        DropdownMenuItem(
          value: 'もえちゃん',
          child: UserDropdownItem(name: 'もえちゃん')
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
