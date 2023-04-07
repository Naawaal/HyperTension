import 'package:flutter/material.dart';
import 'package:hypertension/app/ui/pages/03_otp_screen/otp_bottom.dart';
import 'package:hypertension/app/ui/pages/03_otp_screen/otp_top.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.red,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Back',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          OtpTop(),
        ],
      ),
      bottomNavigationBar: OtpBottom(),
    );
  }
}
