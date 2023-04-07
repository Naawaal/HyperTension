import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class OtpController extends GetxController {
  RxString otpLength = ''.obs;
  RxString userOtp = ''.obs;

  // Firebase Instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyOtp() async {
    final loginController = Get.find<LoginController>();
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: loginController.verificationId.value,
      smsCode: userOtp.value.trim(),
    );
    try {
      await auth.signInWithCredential(credential);
      Get.offAllNamed(NameRoutes.userSignup);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
