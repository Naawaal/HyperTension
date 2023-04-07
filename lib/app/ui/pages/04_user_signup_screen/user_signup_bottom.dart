import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/04_user_signup_controller/user_signup_controller.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';

class UserSignupBottom extends StatelessWidget {
  UserSignupBottom({super.key});

  final userSignupController = Get.find<UserSignupController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      width: Get.width,
      color: Colors.white,
      child: ButtonWidget(
        text: 'Done',
        color: Colors.red,
        onPressed: () async {
          await userSignupController.createUser();
        },
        textColor: Colors.white,
      ),
    );
  }
}
