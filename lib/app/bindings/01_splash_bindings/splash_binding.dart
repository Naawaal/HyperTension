import 'package:get/get.dart';
import 'package:hypertension/app/controllers/01_splash_controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
