import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/utils.dart';
import 'package:uptodo/core/constants/app_router.dart';
import 'package:uptodo/core/data/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
  back();
  skip();
 }

class OnBoardingControllerImp extends OnBoardingController{
  int currentPage = 0;
  late PageController pageController;

  bool get isLastPage {
    return currentPage == onBoardingList.length - 1;
  }

  @override
  void onInit() {
     pageController = PageController();
     super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1 ){
      Get.offAllNamed(AppRouter.kLogin);
    } else{
      pageController.animateToPage(
    currentPage,
    duration: const Duration(microseconds: 800),
    curve: Curves.easeInOut
    );}
  }

  @override
  back() {
    currentPage--;
    pageController.animateToPage(
        currentPage,
        duration: const Duration(microseconds: 800),
        curve: Curves.easeInBack
    );
  }

  @override
  skip() {
    Get.offAllNamed(AppRouter.kLogin);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
  
}