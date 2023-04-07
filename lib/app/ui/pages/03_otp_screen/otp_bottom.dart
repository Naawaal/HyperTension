import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/03_otp_controllers/otp_controller.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';

class OtpBottom extends StatelessWidget {
  OtpBottom({super.key});

  final otpController = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: otpController.otpLength.value.length == 6 ? 80 : 110,
        padding: const EdgeInsets.all(12),
        width: Get.width,
        color: Colors.white,
        child: Column(
          children: [
            Obx(
              () => ButtonWidget(
                text: 'Verify',
                color: otpController.otpLength.value.length == 6
                    ? Colors.red
                    : Colors.grey,
                onPressed: otpController.otpLength.value.length == 6
                    ? () {
                        otpController.verifyOtp();
                      }
                    : () => null,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => InkWell(
                onTap: () {},
                child: Text(
                  otpController.otpLength.value.length != 6 ? 'Resend OTP' : '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
