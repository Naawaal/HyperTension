import 'package:flutter/material.dart';
import 'package:hypertension/app/ui/pages/02_login_screen/login_bottom.dart';
import 'package:hypertension/app/ui/pages/02_login_screen/login_top.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LoginTop(),
        ],
      ),
      bottomNavigationBar: LoginBottom(),
    );
  }
}
