
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dice extends StatelessWidget {
  final int value;

  const dice({super.key,required this.value});

  @override
  Widget build(BuildContext context) {
    List icons=[
     Icons.looks_one,
      Icons.looks_two,
      Icons.looks_3,
      Icons.looks_4,
      Icons.looks_5,
      Icons.looks_6,

    ];

    return Icon(icons[value-1],color:Color(0xffCFB9F8),size: 100,);
  }
}
