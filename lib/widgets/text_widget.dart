import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
   Color color;
  final double size;
  bool isBold;
  var fontFamily;
  bool italic;
  var textAlignment;

   TextWidget(
      {
    required this.text,
     this.color = Colors.white,
    required this.size,
    this.isBold = false,
    this.fontFamily = '',
    this.textAlignment = TextAlign.start,
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
        fontFamily: fontFamily
      ),
    );
  }
}