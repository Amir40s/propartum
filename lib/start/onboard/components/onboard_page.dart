import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propartum/widgets/text_widget.dart';

import 'onboard_slider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height /2,
          child: Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
