import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:propartum/provider/value_provider.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/utilis.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/custom_richtext.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/heights.dart';
import '../../widgets/back_widget.dart';
import '../login/provider/signin_provider.dart';

class OTPSendScreen extends StatelessWidget {
  var otpCode,email;
   OTPSendScreen({super.key, this.otpCode = "", this.email = ""});

   var otp1Controller = TextEditingController();
   var otp2Controller = TextEditingController();
   var otp3Controller = TextEditingController();
   var otp4Controller = TextEditingController();
  final _formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    final valueProvider = Provider.of<ValueProvider>(context,listen: false);
    print(otpCode);
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
                Container(
                    width: Get.width,
                    alignment: AlignmentDirectional.center,
                    child: CustomRichText(press: (){}, firstText: "We sent an OTP to your", secondText: "Email Address")),
                SizedBox(height: height30px,),
                TextWidget(text: "Enter Code", size: 12.0,isBold: true,),
                SizedBox(height: height20px,),

                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 64.0,
                        height: 68.0,
                        child: TextFormField(
                          controller: otp1Controller,
                          onChanged: (value){
                            if (value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value){
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "0",
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                            ),
                            hintStyle: const TextStyle(fontSize: 12.0,color: Colors.grey),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 64.0,
                        height: 68.0,
                        child: TextFormField(
                          controller: otp2Controller,
                          onChanged: (value){
                            if (value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value){
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "0",
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                            ),
                            hintStyle: const TextStyle(fontSize: 12.0,color: Colors.grey),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 64.0,
                        height: 68.0,
                        child: TextFormField(
                          controller: otp3Controller,
                          onChanged: (value){
                            if (value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value){
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "0",
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                            ),
                            hintStyle: const TextStyle(fontSize: 12.0,color: Colors.grey),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 64.0,
                        height: 68.0,
                        child: TextFormField(
                          controller: otp4Controller,
                          onChanged: (value){
                            if (value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          validator: (value){
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "0",
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                            ),
                            hintStyle: const TextStyle(fontSize: 12.0,color: Colors.grey),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: height90px,),
                Container(
                    width: Get.width,
                    alignment: AlignmentDirectional.center,
                    child: CustomRichText(press: (){
                      Get.snackbar("Request submitted", "");
                      int otp = Utils().generateUniqueNumber();
                      otpCode = otp.toString();
                      print(otpCode);
                      Utils().sendMail(recipientEmail: email, otpCode: otp.toString(), context: context,request: "resend");
                    },
                      firstText: "Didn't receive?",
                      secondText: "Resend",
                      textDecoration: TextDecoration.underline,
                      highlightTextColor: Colors.black,
                    )),
                SizedBox(height: height30px,),
                ButtonWidget(text: "verify", onClicked: (){
                  if (_formKey.currentState!.validate()){
                    valueProvider.setLoading(true);
                    final otp = otp1Controller.text.toString() + otp2Controller.text.toString() +
                               otp3Controller.text.toString() + otp4Controller.text.toString();
                    if(otp == otpCode){
                      print(email);
                      valueProvider.setLoading(false);
                      Get.offAllNamed(RoutesName.homeScreen);
                    }else{
                      valueProvider.setLoading(false);
                      Get.snackbar("Verification Failed", "Please check your otp code");
                    }
                  }
                }, width: Get.width)
              ],
            ),
          ),
        )
    );
  }
}
