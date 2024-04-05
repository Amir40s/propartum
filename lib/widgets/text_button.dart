import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback press;
  final String text;
  const TextButtonWidget({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(text,style: TextStyle(
          fontSize: 12.0,
          decoration: TextDecoration.underline,
          color: Colors.black
        ),)
    );
  }
}
