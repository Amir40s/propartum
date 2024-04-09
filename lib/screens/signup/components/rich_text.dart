import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: "By continue, you accept our",
          style: const TextStyle(color: Colors.black),
          children: <InlineSpan>[
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 5.0)),
            TextSpan(
              text: "Privacy Policy",
              style:  TextStyle(color: appColor),
              recognizer: TapGestureRecognizer()
                ..onTap = (){},
            ),
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 5.0)),
            TextSpan(
              text: "\n and",
              style:  TextStyle(color: Colors.black),
            ),
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 5.0)),
            TextSpan(
              text: "Terms of use",
              style:  TextStyle(color: appColor),
              recognizer: TapGestureRecognizer()
                ..onTap = (){},
            ),
          ],
        )
    );
  }
}
