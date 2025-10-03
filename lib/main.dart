import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(title: Text('Dicee'), backgroundColor: Colors.red),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdice = 1;
  int rightdice = 2;

  void changeDiceState(String whichdice) {
    // trigger vibration every time dice changes
    HapticFeedback.mediumImpact();

    setState(() {
      if (whichdice == "left") {
        leftdice = Random().nextInt(6) + 1;
      } else if (whichdice == "right") {
        rightdice = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => changeDiceState("left"),
              child: Image.asset('images/dice$leftdice.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => changeDiceState("right"),
              child: Image.asset('images/dice$rightdice.png'),
            ),
          ),
        ],
      ),
    );
  }
}
