import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/01_daily_check_controller/daily_check_controller.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';
import 'package:hypertension/app/ui/global_widgets/textformfiled_widget.dart';

class DailyCheckMiddle extends StatelessWidget {
  DailyCheckMiddle({super.key});

  final dailyCheckController = Get.put(DailyCheckController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormFieldWidegt(
          controller: dailyCheckController.bloodPressureController.value,
          prefixIcon: Icons.bloodtype_rounded,
          hintText: 'Blood Pressure',
        ),
        const SizedBox(height: 10),
        TextFormFieldWidegt(
          controller: dailyCheckController.plusRateController.value,
          prefixIcon: Icons.monitor_heart_rounded,
          hintText: 'Plus Rate',
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          onPressed: () {
            dailyCheckController.calculateBPAndPR();
          },
          color: Colors.deepPurple,
          textColor: Colors.white,
          text: 'Check',
        )
      ],
    );
  }
}
