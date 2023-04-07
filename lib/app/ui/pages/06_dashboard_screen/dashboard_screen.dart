import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/dashboard_controller.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/dashboard_middel.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFA1A1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 05),
                FutureBuilder(
                  future: dashboardController.getUserName(),
                  builder: (context, snapshot) {
                    return Obx(
                      () => Text(
                        dashboardController.userName.value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffFF0000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const DashBoardMiddle().marginOnly(left: 10, right: 10),
        ],
      ),
    );
  }
}
