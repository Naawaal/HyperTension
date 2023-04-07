import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Color textColor;
  final Color color;
  final String text;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.textColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      elevation: 1.0,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
