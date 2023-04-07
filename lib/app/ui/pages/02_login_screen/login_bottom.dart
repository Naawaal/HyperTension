import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';

class LoginBottom extends StatelessWidget {
  LoginBottom({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          height: 80,
          padding: const EdgeInsets.all(12),
          width: Get.width,
          color: Colors.white,
          child: ButtonWidget(
            text: 'Continue',
            color:
                loginController.mobileNunberController.value.text.length == 10
                    ? Colors.red
                    : Colors.grey,
            onPressed: loginController.mobileNumberLength.value == 10
                ? () async {
                    await loginController.verifyMobileNumber();
                  }
                : () => null,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}
