import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpShowUser extends StatelessWidget {
  const OtpShowUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '    User Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '+91 1234567890',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.verified_user_rounded,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
