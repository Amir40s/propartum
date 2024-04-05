import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/text_widget.dart';

import '../../utils/images.dart';

class OnBoardWelcomeScreen extends StatelessWidget {
  const OnBoardWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(Images.onboard_welcome_bg),
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(text: "Welcome to Propartum", size: 18.0,isBold: true,),
                  SizedBox(height: 20.0,),
                  TextWidget(text: "Where Postpartum, Wellness Comes First.", size: 16.0),
                  SizedBox(height: 20.0,),
                  ButtonWidget(text: "Login", onClicked: (){}, width: Get.width, height: 50.0,radius: 50.0,),
                  SizedBox(height: 10.0,),
                  ButtonWidget(text: "Sign up", onClicked: (){}, width: Get.width, height: 50.0,radius: 50.0,
                    backgroundColor: Colors.white,textColor: Colors.black,),
                  SizedBox(height: 20.0,),
                  TextWidget(text: "or Continue with", size: 12.0),
                  SizedBox(height: 20.0,),
                  ButtonWidget(text: "Continue With Google", onClicked: (){}, width: Get.width, height: 50.0,radius: 50.0,
                    backgroundColor: Colors.white,textColor: Colors.black,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
