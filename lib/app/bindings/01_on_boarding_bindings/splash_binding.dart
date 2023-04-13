import 'package:get/get.dart';
import 'package:hypertension/app/controllers/01_on_boarding_controllers/splash_controller.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
