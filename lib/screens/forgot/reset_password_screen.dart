import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/utils/heights.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/text_widget.dart';

import '../../utils/images.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/custom_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

   final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
   final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height20px,),
                BackButtonWidget(),
                SizedBox(height: height20px,),
                TextWidget(text: "Reset Password", size: 18.0,isBold: true,),

                /// Password Form <<<
                const SizedBox(height: 30.0,),
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
                TextWidget(text: "Re-Type Password", size: 12.0,textAlignment: TextAlign.start,),
                const SizedBox(height: 10.0,),
                CustomPasswordField(
                  hintText: 'Re-type password',
                  prefixPath: MyIcons.ic_lock,
                  controller: confirmPasswordController,
                  errorMessage: 'please enter password',
                  obscurePassword: _obscureConfirmPassword,),

                 SizedBox(height: 50.0,),
                ButtonWidget(text: "Continue", onClicked: (){}, width: Get.width)
              ],
            ),
          ),
        )
    );
  }
}
