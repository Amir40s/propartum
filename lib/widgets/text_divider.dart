import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/widgets/text_widget.dart';

class TextWithDividerWidget extends StatelessWidget {
  final String text;
  const TextWithDividerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
              flex: 4,
              child: Divider(
                thickness: 1.2,
                color: Colors.grey,
              )),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: FractionalOffset.center,
                  child: TextWidget(text: text, size: 12.0,)
              )),
          const Expanded(
              flex: 4,
              child: Divider(
                thickness: 1.2,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
