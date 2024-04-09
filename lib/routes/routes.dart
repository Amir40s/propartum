import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/screens/dashboard/dashboard_screen.dart';
import 'package:propartum/screens/forgot/otp_send_screen.dart';
import 'package:propartum/screens/forgot/reset_password_screen.dart';
import 'package:propartum/screens/home/home_screen.dart';
import 'package:propartum/screens/login/login_screen.dart';
import 'package:propartum/screens/profile/field/profile_info_screen.dart';
import 'package:propartum/screens/signup/signup_screen.dart';
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
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) =>  LoginScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) =>  SignUpScreen());
      case RoutesName.resetScreen:
        return MaterialPageRoute(builder: (context) =>   ResetPasswordScreen());
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(builder: (context) =>   DashboardScreen());
      case RoutesName.otpSendScreen:
        return MaterialPageRoute(builder: (context) =>   OTPSendScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) =>   HomeScreen());
      case RoutesName.profileInfoScreen:
        return MaterialPageRoute(builder: (context) =>   ProfileInfoScreen());

      default :
        return  MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}