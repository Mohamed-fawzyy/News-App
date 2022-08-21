// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final bool? isBold;
  final TextAlign? aling;
  final TextDecoration? textDecore;
  final FontStyle? fontStyle;
  MyText({
    Key? key,
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.isBold = false,
    this.aling,
    this.fontStyle,
    this.textDecore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontStyle: fontStyle,
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
        color: color,
        decoration: textDecore,
      ),
      textAlign: aling,
    );
  }
}
