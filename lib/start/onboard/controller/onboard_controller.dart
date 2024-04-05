import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final int totalPages;

  OnBoardingController(this.totalPages); // Constructor accepting totalPages

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void skipPage() {
    currentPageIndex.value = totalPages - 1;
    pageController.animateToPage(
      totalPages - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void autoScroll() {
    final int currentPage = pageController.page!.toInt();
    final int nextPage = (currentPage + 1) % totalPages;
    pageController.animateToPage(
      nextPage,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
