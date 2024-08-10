import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(image: DecorationImage(image: AssetImage('images/home_background.png'), fit: BoxFit.cover)),
      child: const Center(),
    );
  }
}
