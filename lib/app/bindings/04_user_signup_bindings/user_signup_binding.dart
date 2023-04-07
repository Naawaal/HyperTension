import 'package:get/get.dart';
import 'package:hypertension/app/controllers/04_user_signup_controller/user_signup_controller.dart';

class UserSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignupController>(() => UserSignupController());
  }
}
