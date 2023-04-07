import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/01_daily_check_controller/daily_check_controller.dart';
import 'package:hypertension/app/ui/global_widgets/button_widget.dart';

class DailyCheckBottom extends StatelessWidget {
  DailyCheckBottom({super.key});

  final dailyCheckController = Get.find<DailyCheckController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      width: Get.width,
      color: Colors.white,
      child: ButtonWidget(
        text: 'Sumbit',
        color: Colors.red,
        onPressed: () async {
          await dailyCheckController.submitDailyCheck();
        },
        textColor: Colors.white,
      ),
    );
  }
}
