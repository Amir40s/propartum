import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/utils/constants.dart';

class TextWidget extends StatelessWidget {
  final String text;
  Color color;
  final double size;
  bool isBold,italic;
  var textAlignment,fontFamily,textDecoration;
  var underlineColor;

   TextWidget(
      {
    required this.text,
     this.color = Colors.black,
    required this.size,
    this.isBold = false,
    this.fontFamily = '',
    this.underlineColor = Colors.grey,
    this.textAlignment = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.italic = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
     textAlign: textAlignment,
     // overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration: textDecoration,
        decorationColor: underlineColor
      ),
    );
  }
}