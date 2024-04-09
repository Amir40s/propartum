import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/provider/user_data_provider.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/heights.dart';
import 'package:propartum/widgets/back_widget.dart';
import 'package:propartum/widgets/button_widget.dart';
import 'package:propartum/widgets/custom_textfield.dart';
import 'package:propartum/widgets/simple_text_field_widget.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/value_provider.dart';

class ProfileInfoScreen extends StatelessWidget {
   ProfileInfoScreen({super.key});

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var countryController = TextEditingController();
  var aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<UserDataProvider>(
             builder: (context,provider,child){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   BackButtonWidget(isHeadTextEnabled: true,headText: "Profile Information",),
                   SizedBox(height: height40px,),
                   TextWidget(text: "Full Name", size: 14.0),
                   SizedBox(height: 10.0,),
                   SimpleTextFieldWidget(
                       hintText: nameController.text = provider.model!.name.toString(),
                       controller: nameController,
                       errorMessage: "enter valid email"),
                   SizedBox(height: 20.0,),
                   TextWidget(text: "Email Address", size: 14.0),
                   SizedBox(height: 10.0,),
                   Container(
                       width: Get.width,
                       color: lightGrey,
                       padding: EdgeInsets.all(20.0),
                       child: TextWidget(text: provider.model!.email.toString(), size:16.0),
                   ),
                   SizedBox(height: 20.0,),
                   TextWidget(text: "Phone Number", size: 14.0),
                   SizedBox(height: 10.0,),
                   SimpleTextFieldWidget(
                       hintText: phoneController.text = provider.model!.name.toString(),
                       controller: phoneController,
                       errorMessage: "enter valid number"),

                   SizedBox(height: 20.0,),
                   TextWidget(text: "Country", size: 14.0),
                   SizedBox(height: 10.0,),
                   SimpleTextFieldWidget(
                       hintText: countryController.text = provider.model!.country.toString(),
                       controller: countryController,
                       errorMessage: "enter valid country"),

                   SizedBox(height: 20.0,),
                   TextWidget(text: "About", size: 14.0),
                   SizedBox(height: 10.0,),
                   SimpleTextFieldWidget(
                       hintText: aboutController.text = provider.model!.country.toString(),
                       controller: aboutController,
                       maxLines: 10,
                       errorMessage: ""),

                   SizedBox(height: height40px,),
                   Container(
                       margin: EdgeInsets.only(left: 20.0,right: 20.0),
                       child:
                       ButtonWidget(text: "Update",loadingMesasge: 'updating', onClicked: (){
                         Provider.of<ValueProvider>(context,listen: false).setLoading(true);
                        Timer(const Duration(seconds: 3), () {
                          Provider.of<ValueProvider>(context,listen: false).setLoading(false);

                        });
                       }, width: Get.width)
                   ) ,
                 ],
               );
             },
            ),
          ),
        ),
      ),
    );
  }
}
