import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/start/onboard/onbaord_screen.dart';
import 'package:propartum/utils/database.dart';

import '../utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
      if(currentUser!=null){
        Get.offAllNamed(RoutesName.homeScreen);
      }else{
        Get.offAllNamed(RoutesName.onboardScreen);
      }

    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.width,
          child: Image.asset(Images.logo),
        ),
      ),
    );
  }
}
