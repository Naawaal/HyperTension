import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/splash_controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final splashController = Get.put(SplashController());

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashController.checkAuth;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
