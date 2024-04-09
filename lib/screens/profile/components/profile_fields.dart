import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:propartum/routes/routes_name.dart';
import 'package:propartum/utils/heights.dart';

import '../../../utils/images.dart';
import '../../../widgets/custom_tiles_widget.dart';
import '../../../widgets/text_widget.dart';

class ProfileFields extends StatelessWidget {
  const ProfileFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 5.0,top: 5.0),
            child: TextWidget(text: "Accounts", size: 14.0,textAlignment: TextAlign.start,isBold: true,)),
        const CustomTilesWidget(image: MyIcons.ic_person,title: 'Profile Information',routesName: RoutesName.profileInfoScreen,),
        const SizedBox(height: 10.0,),
        const CustomTilesWidget(image: MyIcons.ic_reset,title: 'Reset pin/ password',),
        const SizedBox(height: 10.0,),
        const CustomTilesWidget(image: MyIcons.ic_paymentProfile,title: 'payment',),

        const SizedBox(height: 20.0),
        Container(
            padding: EdgeInsets.only(bottom: 5.0,top: 5.0),
            child: TextWidget(text: "Settings", size: 14.0,textAlignment: TextAlign.start,isBold: true,)),
        const SizedBox(height: 10.0,),
        const CustomTilesWidget(image: MyIcons.ic_terms,title: 'Terms and Conditions',),
        const SizedBox(height: 10.0,),
        const CustomTilesWidget(image: MyIcons.ic_logout,title: 'Log out',routesName: 'logout',),
      ],
    );
  }
}
