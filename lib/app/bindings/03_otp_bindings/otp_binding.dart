import 'package:get/get.dart';
import 'package:hypertension/app/controllers/03_otp_controllers/otp_controller.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
