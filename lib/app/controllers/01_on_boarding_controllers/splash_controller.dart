import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension/app/routes/names_routes.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0.obs;

  final controller = LiquidController().obs;
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();

    Timer(
      const Duration(microseconds: 0),
      () {
        // check if onboarding has already been shown
        bool onBoardingShown = box.read('onBoardingShown') ?? false;

        if (onBoardingShown == true) {
          // navigate to your home screen or any other screen
          Get.offNamed(NameRoutes.splashScreen);
        } else {
          // navigate to the onboarding screen
          Get.offNamed(NameRoutes.onBoardingScreen);
        }
      },
    );
  }

  void moveToNextPage(int page) {
    currentPage.value = page;
  }

  void onBackButtonPressed() {
    if (currentPage.value == 2) {
      controller.value.jumpToPage(page: 1);
    } else {
      controller.value.jumpToPage(page: 0);
    }
  }

  void onNextButtonPressed() async {
    if (currentPage.value == 2) {
      await box.write('onBoardingShown', true);
      Get.offNamed(NameRoutes.splashScreen);
    } else {
      controller.value.jumpToPage(page: currentPage.value + 1);
    }
  }

  void onSkipButtonPressed() {
    controller.value.jumpToPage(page: 2);
  }
}
