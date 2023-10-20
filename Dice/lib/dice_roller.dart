import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  var currentDiceRoll = 2;
  void RollDice() {
    setState(() {
      currentDiceRoll =  randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice/dice-$currentDiceRoll.png',
          width: 200,
        ),
        TextButton(
          onPressed: RollDice,
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 78, 248),
              textStyle: const TextStyle(
                fontSize: 25,
              ),
              padding: const EdgeInsets.all(15)),
          child: const Text(
            'Roll Dice',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
