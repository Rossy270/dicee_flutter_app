import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Dicee"),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void roolDice() {
    setState(() {
      var lastLeftDice = leftDiceNumber;
      var lastRightDice = rightDiceNumber;

      while (lastRightDice == rightDiceNumber) {
        rightDiceNumber = Random().nextInt(6) + 1;
        while (lastLeftDice == leftDiceNumber) {
          leftDiceNumber = Random().nextInt(6) + 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                roolDice();
              },
              child: Image.asset("imagens/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                roolDice();
              },
              child: Image.asset("imagens/dice$rightDiceNumber.png"),
            ),
          )
        ],
      ),
    );
  }
}
