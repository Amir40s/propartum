import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/app_text.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/text_button.dart';

import '../../routes/routes.dart';
import '../../widgets/text_widget.dart';
import 'components/onboard_page.dart';
import 'components/onboard_skip_button.dart';
import 'components/onboard_slider.dart';
import 'controller/onboard_controller.dart';

class OnboardScreen extends StatelessWidget {
   OnboardScreen({super.key});

   List headList  = ['Expand Your Impact','Enhance Your Skills','Connect with Peers'];
   List descList  = [AppText.onboard1_des,AppText.onboard2_des,AppText.onboard3_des];

  @override
  Widget build(BuildContext context) {
    final int totalPages = 3;
    final pageController = Get.put(OnBoardingController(totalPages));
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              PageView(
                controller: pageController.pageController,
                onPageChanged: pageController.updatePageIndicator,
                children: const[
                  OnBoardingPage(
                    image: Images.onboard_one,
                  ),
                  OnBoardingPage(
                    image: Images.onboard_two,
                  ),
                  OnBoardingPage(
                    image: Images.onboard_three,
                  ),
                ],
              ),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(top: Get.width * .99),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0,),
                Obx(() =>  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(text: headList[pageController.currentPageIndex.toInt()], size: 16.0,color: Colors.black,isBold : true),
                ),
                ),
               Obx(() =>  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextWidget(text: descList[pageController.currentPageIndex.toInt()], size: 14.0,color: Colors.black,textAlignment: TextAlign.center,),
               ),),
                SizedBox(height: 20.0,),
                const OnBoardingSliderIndicator(),
                Container(
                    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 20.0),
                    child: ButtonWidget(text: "Continue", onClicked: (){
                      Get.toNamed(RoutesName.onboardWelcomeScreen);
                    }, width: Get.width, height: 50.0,)),
                SizedBox(height: 10.0,),
                TextButtonWidget(press: (){
                Get.toNamed(RoutesName.onboardWelcomeScreen);
                },text: "Skip",)
              ],
            ),
          ),
            ],
          ),
        )
    );
  }
}
