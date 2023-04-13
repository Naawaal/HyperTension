import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';
import 'package:hypertension/app/ui/global_widgets/textformfiled_widget.dart';

class LoginTop extends StatelessWidget {
  LoginTop({super.key});

  final loginController = Get.find<LoginController>();

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
              'Login or SignUp via mobile number to continue',
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
          Obx(
            () {
              return TextFormFieldWidegt(
                controller: loginController.mobileNunberController.value,
                hintText: 'Mobile Number',
                prefixIcon: Icons.phone_rounded,
                suffixIcon: loginController.mobileNumberLength.value == 10
                    ? Icons.check_circle_rounded
                    : null,
                onChanged: (value) {
                  loginController.mobileNumberLength.value = value.length;
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ).marginOnly(top: 45, left: 10, right: 10);
  }
}
