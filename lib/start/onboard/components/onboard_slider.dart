import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/constants.dart';
import '../controller/onboard_controller.dart';

class OnBoardingSliderIndicator extends StatelessWidget {
  const OnBoardingSliderIndicator({Key? key});

  @override
  Widget build(BuildContext context) {
    final pageController = OnBoardingController.instance;
    return Positioned(
      bottom: 20.0,
      left: 150.0,
      right: 150.0,
      child: SmoothPageIndicator(
        controller: pageController.pageController,
        onDotClicked: pageController.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: appColor,
          dotHeight: 8.0,
          dotWidth: 8.0,
          dotColor: appColor,
        ),
      ),
    );
  }
}
