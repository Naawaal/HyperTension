import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/03_otp_controllers/otp_controller.dart';
import 'package:hypertension/app/ui/pages/03_otp_screen/otp_show_user.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpTop extends StatelessWidget {
  OtpTop({super.key});

  final otpController = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter the OTP sent to your mobile number',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OtpShowUser(),
          const SizedBox(
            height: 10,
          ),
          OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 50,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceEvenly,
            fieldStyle: FieldStyle.box,
            onChanged: (value) {
              otpController.otpLength.value = value;
              otpController.userOtp.value = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ).marginOnly(top: 40, left: 10, right: 10);
  }
}
