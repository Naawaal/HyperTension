import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class LoginController extends GetxController {
  final mobileNunberController = TextEditingController().obs;
  RxInt mobileNumberLength = 0.obs;

  RxString verificationId = ''.obs;

  // Firebase Instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyMobileNumber() async {
    final mobileNumber = mobileNunberController.value.text.trim();

    auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 90),
      verificationCompleted: (phoneAuthCredential) {
        auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        Get.snackbar('Error', error.toString());
      },
      codeSent: (codeSendVerificationId, token) {
        verificationId.value = codeSendVerificationId;
        Get.toNamed(NameRoutes.otpScreen);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      phoneNumber: "+977$mobileNumber",
    );
  }
}
