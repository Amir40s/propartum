import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomRichText extends StatelessWidget {
  final VoidCallback press;
  final firstText,secondText;
  var textDecoration,highlightTextColor;
   CustomRichText({super.key, required this.press,
    required this.firstText,required this.secondText,
    this.textDecoration = TextDecoration.none,
    this.highlightTextColor = Colors.deepOrange
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: firstText,
      style: const TextStyle(color: Colors.black),
      children: <InlineSpan>[
        const WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(width: 5.0)),
        TextSpan(
          text: secondText,
          style:  TextStyle(color: highlightTextColor,fontWeight: FontWeight.bold,decoration: textDecoration),
          recognizer: TapGestureRecognizer()
            ..onTap = press,
        ),
      ],
    )
    );
  }
}
