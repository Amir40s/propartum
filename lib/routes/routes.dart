import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/start/onbaord_welcome/onbaord_welcome_screen.dart';
import 'package:propartum/start/onboard/onbaord_screen.dart';
import 'package:propartum/start/splash_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) =>  SplashScreen());
      case RoutesName.onboardScreen:
        return MaterialPageRoute(builder: (context) => OnboardScreen());
      case RoutesName.onboardWelcomeScreen:
        return MaterialPageRoute(builder: (context) =>  OnBoardWelcomeScreen());

      default :
        return  MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}