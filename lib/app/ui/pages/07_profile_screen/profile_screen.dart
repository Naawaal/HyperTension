import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/02_profile_controller/profile_controller.dart';
import 'package:hypertension/app/data/models/user_signup_model.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FutureBuilder<UserSignupModel>(
                future: profileController.fetchUserDataFromFirebase(),
                builder: (context, AsyncSnapshot<UserSignupModel> snapshot) {
                  final user = snapshot.data;
                  if (user == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Text(
                          'Name: ${user.name}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Age: ${user.age}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Mobile Number: ${user.phone}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Gender: ${user.gender}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Height: ${user.height}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Weight: ${user.weight}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'Occupation: ${user.occupation}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Text(
                          'hasHyperTension: ${user.hasHyperTension}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.logout_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                try {
                                  Get.offAllNamed(NameRoutes.loginScreen);
                                  await FirebaseAuth.instance.signOut();
                                } catch (e) {
                                  Get.snackbar('Error', e.toString());
                                }
                              },
                              child: const Text(
                                'Logout ?',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ).marginOnly(left: 10, right: 10, top: 5),
          ],
        ),
      ),
    );
  }
}
