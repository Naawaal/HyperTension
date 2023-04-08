import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension/app/controllers/03_otp_controllers/otp_controller.dart';
import 'package:hypertension/app/data/models/user_signup_model.dart';

class OtpShowUser extends StatelessWidget {
  OtpShowUser({super.key});

  final otpController = Get.put(OtpController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: FutureBuilder<UserSignupModel>(
        future: otpController.fetchUserDataFromFirebase(),
        builder: (context, AsyncSnapshot<UserSignupModel> snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${user!.name ?? 'User is not registered'}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '+977 ${box.read('mobileNumber')}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      user.name != null ? Icons.check_circle : Icons.error,
                      color: user.name != null ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
