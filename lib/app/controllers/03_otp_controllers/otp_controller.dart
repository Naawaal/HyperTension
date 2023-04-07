import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class OtpController extends GetxController {
  RxString otpLength = ''.obs;
  RxString userOtp = ''.obs;
  RxInt setResendingToken = 0.obs;

  var resendTimer = 0.obs;

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

  Future<void> resendOtp() async {
    // Generate and send new OTP here
    await generateOtp();
    // Start the timer with 60 seconds
    resendTimer.value = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Decrement the timer every second
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        // Stop the timer when it reaches 0
        timer.cancel();
      }
    });
  }

  Future<void> generateOtp() async {
    final loginController = Get.find<LoginController>();

    await auth.verifyPhoneNumber(
      phoneNumber: "+977${loginController.mobileNunberController.value.text}",
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        Get.snackbar('Error', error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        loginController.verificationId.value = verificationId;
        setResendingToken.value = forceResendingToken!;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 90),
      forceResendingToken: setResendingToken.value,
    );
  }
}
