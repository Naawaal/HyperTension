import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/dashboard_middel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              children: const [
                Text(
                  'Welcome back ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFA1A1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 05),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffFF0000),
                    fontWeight: FontWeight.w500,
                  ),
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
