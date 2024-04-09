import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/text_widget.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 175.0,
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: _appointmentsDesign
      ),
    );
  }

  Widget _appointmentsDesign(BuildContext context, int index) {
    return Container(
      width: Get.width /1.1,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(Images.card_bg),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        children: [
          cardTopHead(),
          dataField(text: "Postnatal Doula", image: MyIcons.ic_message),
          dataField(text: "08:00AM-10:30AM", image: MyIcons.ic_clock),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              dataField(text: "7 March, 2024", image: MyIcons.ic_calender),
            ],
          )


        ],
      ),
    );
  }

  Container dataField({required text,required image}){
    return Container(
      margin: EdgeInsets.only(left: 10.0,top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image,width: 24.0,height: 24.0,color: Colors.white,),
          SizedBox(width: 5.0,),
          TextWidget(text: text, size: 14.0,color: Colors.white,),
        ],
      ),
    );
  }

  Row cardTopHead(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Images.demo_person),
              ),
            ),
            const SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: "Dr. Jamilia Beasley", size: 16.0,isBold: true,color: Colors.white,),
              ],
            ),
          ],
        ),

        const Row(
          children: [
            Icon(Icons.keyboard_arrow_right,size: 24.0,color: Colors.white,),
          ],
        )
      ],
    );
  }
}
