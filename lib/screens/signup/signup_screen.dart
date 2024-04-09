import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/provider/value_provider.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/screens/signup/components/rich_text.dart';
import 'package:propartum/screens/signup/provider/signup_provider.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/widgets/custom_textfield.dart';
import 'package:propartum/utils/heights.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/custom_richtext.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_password_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final provider  =Provider.of<SignUpProvider>(context,listen: false);
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
                TextWidget(text: "Create an Account", size: 18.0,isBold: true,),

                SizedBox(height: height20px,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Full name Form <<<
                      TextWidget(text: "Full Name", size: 12.0,textAlignment: TextAlign.start,),
                      const SizedBox(height: 10.0,),
                      CustomTextField(hintText: "Enter your Name",errorMessage: 'please enter name', controller: nameController,prefixPath: MyIcons.ic_person,),

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
                        errorMessage: 'please enter password',
                        obscurePassword: _obscurePassword,),

                      /// Confirm Password Form <<<
                      const SizedBox(height: 10.0,),
                      TextWidget(text: "Confirm Password", size: 12.0,textAlignment: TextAlign.start,),
                      const SizedBox(height: 10.0,),
                      CustomPasswordField(
                        hintText: 'Confirm password',
                        prefixPath: MyIcons.ic_lock,
                        controller: confirmPasswordController,
                        errorMessage: 'please enter password',
                        obscurePassword: _obscureConfirmPassword,),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Consumer<ValueProvider>(
                            builder: (context, provider, child) {
                              return Checkbox(
                                  value: provider.isChecked,
                                  activeColor: appColor,
                                  onChanged: (newValue){
                                    provider.setChecked(newValue!);
                                  });
                            },
                          ),
                         const  RichTextWidget()
                        ],
                      )
                    ],
                  ),
                ),

              SizedBox(height: height20px,),
              Container(
                   margin: EdgeInsets.only(left: 20.0,right: 20.0),
                   child:
                   ButtonWidget(text: "Create Account",loadingMesasge: 'creating', onClicked: (){
                     if (_formKey.currentState!.validate()) {
                       valueProvider.setLoading(true);
                       if(GetUtils.isEmail(emailController.text.toString())){
                         if(passwordController.text.length >= 8){
                           if(passwordController.text.toString() == confirmPasswordController.text.toString()) {
                             provider.signUpWithGoogle(
                                 email: emailController.text,
                                 password: passwordController.text.toString(),
                                 fullName: nameController.text.toString()
                             );
                           }else{
                             valueProvider.setLoading(false);
                             Get.snackbar("Error", "Passwords don't match");
                           }
                         }else{
                           valueProvider.setLoading(false);
                           Get.snackbar("Error", "Password must be 8 characters long");
                         }
                       }else{
                         valueProvider.setLoading(false);
                         Get.snackbar(
                           "Error",
                           "Please enter valid email",
                           backgroundColor: Colors.red,
                           duration: Duration(seconds: 2),
                         );
                         return;
                       }
                     }
                   }, width: Get.width)
  ),
                SizedBox(height: height20px,),
                CustomRichText(press: (){
                  Get.toNamed(RoutesName.loginScreen);
                }, firstText: "Already have an account?", secondText: "Login"),
                SizedBox(height: height20px,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
