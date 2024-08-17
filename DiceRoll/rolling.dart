import 'package:flutter/material.dart';
import 'dart:math';

class rolling extends StatefulWidget {
  const rolling({super.key});
  @override
  State<rolling> createState() => _RollingDice();
}

class _RollingDice extends State<rolling> {

  var activeImage ='Assets/images/Dice/1.png';


  void rollDice(){
    var ranNum = Random().nextInt(6)+1;
    setState(() {
      activeImage = 'Assets/images/Dice/$ranNum.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(activeImage),
              const SizedBox(
                height:20.0,
              ),
              TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  textStyle: const TextStyle(fontSize: 28)
                ),
                child: const Text('Roll Dice')
              ),
            ],
          );
  }
}