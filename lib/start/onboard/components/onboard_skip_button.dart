import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkipButton {
  Widget onBoardingSkipButton() {
    return Positioned(
        top: 15,
        right: 15,
        child: ElevatedButton(
            onPressed: () {
             // Get.to(const SignInScreen());
            },
            child: Text("Skip"),
            ));
  }
}
