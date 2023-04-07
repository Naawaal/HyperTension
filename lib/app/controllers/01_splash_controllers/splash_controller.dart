import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    showSplashScreen();
    super.onInit();
  }

  void showSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(NameRoutes.loginScreen);
    });
  }
}
