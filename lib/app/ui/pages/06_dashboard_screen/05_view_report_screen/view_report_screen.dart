import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/05_view_report_controller/view_report_controller.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/05_view_report_screen/view_report_middle.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/05_view_report_screen/view_report_top.dart';

class ViewReportScreen extends StatelessWidget {
  ViewReportScreen({super.key});

  final viewReportController = Get.put(ViewReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Report',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ViewReportTop(),
              const ViewReportMiddle(),
            ],
          ),
        ),
      ),
    );
  }
}
