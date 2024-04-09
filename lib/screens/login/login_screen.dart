import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:propartum/screens/login/provider/signin_provider.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/widgets/all_socials_icons_widget.dart';
import 'package:propartum/widgets/text_divider.dart';
import 'package:provider/provider.dart';

import '../../provider/value_provider.dart';
import '../../routes/routes_name.dart';
import '../../utils/heights.dart';
import '../../utils/images.dart';
import '../../utils/utilis.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_password_widget.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey =  GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    final valueProvider  =Provider.of<ValueProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Images.logo,width: Get.width,height: Get.width/2,fit: BoxFit.contain,),
                TextWidget(text: "Login to your Account", size: 18.0,isBold: true,),

                SizedBox(height: height20px,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Password Email <<<
                      const SizedBox(height: 10.0,),
                      TextWidget(text: "E-mail", size: 12.0,textAlignment: TextAlign.start,),
                      const SizedBox(height: 10.0,),
                      CustomTextField(hintText: "Enter your mail",errorMessage: 'please enter email', controller: emailController,prefixPath: MyIcons.ic_email,),

                      /// Password Form <<<
                      const SizedBox(height: 10.0,),
                      TextWidget(text: "Password", size: 12.0,textAlignment: TextAlign.start,),
                      const SizedBox(height: 10.0,),
                      CustomPasswordField(
                        hintText: 'password',
                        prefixPath: MyIcons.ic_lock,
                        controller: passwordController,
                        errorMessage: 'please enetr password',
                        obscurePassword: _obscurePassword,),
                      SizedBox(height: 10.0,),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(RoutesName.resetScreen);
                        },
                        child: TextWidget(
                          text: "Forgot Password?",
                          size: 12.0,
                          textAlignment: TextAlign.start,
                          color: appColor,
                          isBold: true,
                          textDecoration: TextDecoration.underline,
                          underlineColor: appColor,
                        ),
                      ),

                    ],
                  ),
                ),

               const SizedBox(height: 50.0,),
                Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    child: ButtonWidget(text: "Login", onClicked: (){
                      if (_formKey.currentState!.validate()) {
                        if(GetUtils.isEmail(emailController.text.toString())){
                          valueProvider.setLoading(true);
                          signInProvider.signInWithGoogle(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                              context: context);

                        }
                      }

                    }, width: Get.width)),
               const SizedBox(height: 30.0,),
              const TextWithDividerWidget(text: "OR"),
              const SizedBox(height: 30.0,),
               const AllSocialsIconsWidget(),

                SizedBox(height: height30px,),
                CustomRichText(press: (){
                  Get.toNamed(RoutesName.signupScreen);
                }, firstText: "New Here?", secondText: "Register"),
                SizedBox(height: height20px,),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
