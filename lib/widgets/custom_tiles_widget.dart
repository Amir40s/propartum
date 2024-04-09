import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/screens/login/provider/signin_provider.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../utils/images.dart';


class CustomTilesWidget extends StatelessWidget {
  final String image,title;
  final routesName;

  const CustomTilesWidget({super.key, required this.image, required this.title, this.routesName = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(routesName == "logout"){
          Provider.of<SignInProvider>(context,listen: false).signOut(context: context);
        }else{
          Get.toNamed(routesName);
        }

      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade50,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: Get.width * .03,),
                Image.asset(image,width: 20.0,height: 20.0,color: appColor,),
                SizedBox(width: Get.width * .03,),
                TextWidget(text: title, size: 12.0,textAlignment: TextAlign.start,color: appColor,isBold: true,)
              ],
            ),
            Icon(Icons.keyboard_arrow_right_sharp,size: 24.0,color: appColor,)
          ],
        ),
      ),
    );
  }
}
