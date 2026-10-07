import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/widgets/dicewidget.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int value1 = 1;

  int value2 = 1;

  late int total = value1 + value2;

  String imageSad = "assets/images/sadImage.webp";
  String happyImage = "assets/images/happy.webp";

  reset() {
    value1 = 1;
    value2 = 1;
    total = value1 + value2;
  }

  roll() {
    value1 = Random().nextInt(6) + 1;
    value2 = Random().nextInt(6) + 1;
    total = value1 + value2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Dice", style: TextStyle(color: Color(0xffCFB9F8))),
        centerTitle: true,
        backgroundColor: Color(0xff67538C),
        leading: Icon(Icons.casino, color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Center(child: Text("Total is ${total}",style: Theme.of(context).textTheme.headlineSmall,),),
          SizedBox(height: 20),
          total >= 10
              ? Center(
                child: Column(
                  children: [
                    Center(child: Image.asset(happyImage)),
                    SizedBox(height: 8,),
                    Text("You Won",style: Theme.of(context).textTheme.headlineSmall,)
                  ],
                ),
              )
              : Center(
                child: Column(
                  children: [
                    Center(child: Image.asset(imageSad)),
                    SizedBox(height: 8,),
                    Text("You Lose",style: Theme.of(context).textTheme.headlineSmall,)
                  ],
                ),
              ),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dice(value: value1),
                dice(value: value2),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { setState((){
                      roll();
                    });},
                    child: Text(
                      "roll",
                      style: TextStyle(color: Color(0xffFACD39)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF14235),
                      foregroundColor: Colors.transparent,
                    ),
                  ),

                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed:(){
                      setState(() {
                        reset();
                      });
                    },
                    child: Text(
                      "reset",
                      style: TextStyle(color: Color(0xffFACD39)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF14235),
                      foregroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
