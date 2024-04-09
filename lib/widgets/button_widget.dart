import 'package:flutter/material.dart';
import 'package:propartum/provider/value_provider.dart';
import 'package:propartum/utils/constants.dart';
import 'package:provider/provider.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  var backgroundColor;
  final width;
  double height;
  double radius;
  var textColor;
   var iconPath;
   var borderColor;
   final loadingMesasge;
   ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundColor,
    this.iconPath,
     this.textColor = Colors.white,
     this.borderColor,
    required this.width,
  this.height = 55.0,
     this.radius = 10.0, this.loadingMesasge = "loading"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>

      Consumer<ValueProvider>(
        builder: (context,provider,child){
          return
            provider.isLoading == false ?
            InkWell(
            onTap: onClicked,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: borderColor!=null ? Border.all(color: Colors.white,width: 1.0) :  Border.all(color: appColor),
                color: backgroundColor ?? appColor,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(iconPath!=null)
                    Image.asset(iconPath,width: 25,height: 25,fit: BoxFit.contain,),
                  if(iconPath!=null)
                    SizedBox(width: 10.0,),
                  Text(
                    text,
                    style:  TextStyle(fontSize: 14, color: textColor,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )  :   Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: borderColor!=null ? Border.all(color: Colors.white,width: 1.0) :  Border.all(color: appColor),
              color: backgroundColor ?? appColor,),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$loadingMesasge, please wait',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      );
}