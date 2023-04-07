import 'package:get/get.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
