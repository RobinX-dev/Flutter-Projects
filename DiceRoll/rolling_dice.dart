import 'package:flutter/material.dart';
import 'package:flutter_application_1/rolling.dart';

class main_container extends StatelessWidget {
  const main_container({super.key});

  void rollDice(){
    print('Rolling');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 234, 255),
            Color.fromARGB(255, 0, 214, 168)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: const Center(
          child: rolling()
        ),
      );
  }
}