import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/text_widget.dart';

class Header extends StatelessWidget {
  final  name;
  const Header({super.key, this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(Images.demo_person),
            ),
            SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "welcome back", size: 14.0),
                TextWidget(text: name ?? "", size: 14.0,isBold: true,),
              ],
            ),
          ],
        ),

        Row(
          children: [
            Image.asset(MyIcons.ic_message,width: 24.0,height: 24.0,),
           const SizedBox(width: 10.0,),
            Image.asset(MyIcons.ic_notification,width: 24.0,height: 24.0,),
          ],
        )

      ],
    );
  }
}
