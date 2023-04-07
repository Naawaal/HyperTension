import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';

class UserSignupBottom extends StatelessWidget {
  const UserSignupBottom({super.key});

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
        onPressed: () {
          Get.offAllNamed(NameRoutes.homepageScreen);
        },
        textColor: Colors.white,
      ),
    );
  }
}
