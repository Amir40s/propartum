import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/heights.dart';
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
                  SizedBox(height: height20px,),
                  TextWidget(text: "Where Postpartum, Wellness Comes First.", size: 16.0),
                  SizedBox(height: height20px,),
                  ButtonWidget(text: "Login", onClicked: (){
                    Get.toNamed(RoutesName.loginScreen);
                  }, width: Get.width,radius: 20.0,),
                  SizedBox(height: height20px,),
                  ButtonWidget(text: "Sign up", onClicked: (){
                    Get.toNamed(RoutesName.signupScreen);
                  }, width: Get.width,radius: 20.0,
                    backgroundColor: Colors.white,textColor: Colors.black,borderColor: Colors.white,),
                  SizedBox(height: height20px,),
                  TextWidget(text: "or Continue with", size: 12.0,isBold: true,),
                  SizedBox(height: height20px,),
                  ButtonWidget(text: "Continue With Google", onClicked: (){}, width: Get.width,radius: 20.0,
                    backgroundColor: Colors.white38,textColor: Colors.black,iconPath: MyIcons.ic_google,borderColor: Colors.white,),
                  SizedBox(height: height20px,),
                ],
              ),
            ),
          ),
        )
    );
  }
}
