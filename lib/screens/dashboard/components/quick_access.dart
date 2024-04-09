import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:propartum/utils/constants.dart';
import 'package:propartum/utils/images.dart';
import 'package:propartum/widgets/text_widget.dart';

class QuickAccess extends StatelessWidget {
   QuickAccess({super.key});

  Map<String,dynamic> map = {

  };

  List<Map<String, dynamic>> listData = [
    {"image":MyIcons.ic_patient,"title":"Patients"},
    {"image":MyIcons.ic_session,"title":"Sessions"},
    {"image":MyIcons.ic_assessment,"title":"Assessment"},
    {"image":MyIcons.ic_resource,"title":"Resources"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent:100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10)
          , itemBuilder: _itemsBuilder
      ),
    );
  }

  Widget _itemsBuilder(BuildContext context,int index){
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
          color: Colors.deepOrange.shade50
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(listData[index]['image'],width: 25.0,height: 25.0,),
          SizedBox(height: 10.0,),
          TextWidget(text: listData[index]['title'], size: 12.0),
        ],
      ),
    );
  }

}
