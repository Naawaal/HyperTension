import 'package:flutter/material.dart';
import 'package:hypertension/app/ui/pages/04_user_signup_screen/user_signup_bottom.dart';
import 'package:hypertension/app/ui/pages/04_user_signup_screen/user_signup_top.dart';

class UserSignupScreen extends StatelessWidget {
  const UserSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: UserSignupTop(),
      ),
      bottomNavigationBar: const UserSignupBottom(),
    );
  }
}
