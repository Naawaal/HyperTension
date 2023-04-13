import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/01_daily_check_screen/daily_check_bottom.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/01_daily_check_screen/daily_check_middle.dart';

class DailyCheckScreen extends StatelessWidget {
  const DailyCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Check',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: DailyCheckMiddle().marginOnly(left: 10, right: 10),
      bottomNavigationBar: DailyCheckBottom(),
    );
  }
}
