import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propartum/provider/user_data_provider.dart';
import 'package:propartum/utils/heights.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/back_widget.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_tiles_widget.dart';
import 'components/profile_fields.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(text: "profile", size: 14.0,textAlignment: TextAlign.center,),

                SizedBox(height: height20px,),
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(Images.demo_person),
                  ),
                ),
                SizedBox(height: height10px,),
                Consumer<UserDataProvider>(
                   builder: (context,provider,child){
                     return TextWidget(
                       text: provider.model!.name != null ? provider.model!.name.toString() : "unknown",
                       size: 12.0,isBold: true,);
                   },
                ),
                 SizedBox(height: height10px,),
                 const ProfileFields()




              ],
            ),
          ),
        ),
    )
    );
  }
}
