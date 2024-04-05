import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/images.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  var backgroundColor;
  final width,height;
  double radius;
  var textColor;

   ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundColor,
     this.textColor = Colors.white,
    required this.width,
   required this.height,
     this.radius = 10.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>

      InkWell(
        onTap: onClicked,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Colors.white,width: 1.0),
            color: backgroundColor ?? appColor,
          ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.onboard_two,width: 25,height: 25,fit: BoxFit.contain,),
        SizedBox(width: 10.0,),
        Text(
          text,
          style:  TextStyle(fontSize: 14, color: textColor,fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ),
      );
}