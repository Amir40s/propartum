import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propartum/widgets/text_widget.dart';

class BackButtonWidget extends StatelessWidget {
  final headText;
  bool isBackEnabled,isHeadTextEnabled;
   BackButtonWidget({super.key,this.headText = "",this.isBackEnabled = true,this.isHeadTextEnabled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Row(
        children: [
        if(isBackEnabled)
          Row(
            children: [
              const Icon(Icons.arrow_back_ios,weight: 2,size: 20.0,),
              const SizedBox(width: 5.0,),
              TextWidget(text: "Back", size: 14.0,color: Colors.black,),
            ],
          ),
        if(isHeadTextEnabled)
        Container(
            width: Get.width/1.5,
            child: TextWidget(text: headText, size: 14.0,color: Colors.black,textAlignment: TextAlign.center,isBold: true,))
        ],
      ),
    );
  }
}
