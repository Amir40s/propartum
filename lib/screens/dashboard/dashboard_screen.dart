import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:propartum/model/UserModel.dart';
import 'package:propartum/provider/user_data_provider.dart';
import 'package:propartum/utils/database.dart';
import 'package:propartum/widgets/header.dart';
import 'package:propartum/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../shared_preference/shared_preference_provider.dart';
import 'components/appointment.dart';
import 'components/quick_access.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserDataProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(name: provider.model?.name.toString()),
               const SizedBox(height: 30.0,),
                TextWidget(text: "Appointment", size: 14.0,isBold: true,textAlignment: TextAlign.start,),
               const SizedBox(height: 10.0,),
                Appointments(),
                const SizedBox(height: 10.0,),
                TextWidget(text: "Quick Access", size: 14.0,isBold: true,textAlignment: TextAlign.start,),
                const SizedBox(height: 10.0,),
                QuickAccess(),
              ],
            ),
          ),
        )
      ),
    );
  }



}
