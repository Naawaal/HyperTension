import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/04_about_hypertension_screen/about_hypertension_middle.dart';

class AboutHyperTensionScreen extends StatelessWidget {
  const AboutHyperTensionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About HyperTension',
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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AboutHyperTensionMiddle(),
      ),
    );
  }
}
