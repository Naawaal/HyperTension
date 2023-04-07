import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension/app/controllers/02_login_controllers/login_controller.dart';
import 'package:hypertension/app/controllers/04_user_signup_controller/user_signup_controller.dart';
import 'package:hypertension/app/ui/global_widgets/textformfiled_widget.dart';

class UserSignupTop extends StatelessWidget {
  UserSignupTop({super.key});

  final userSignupController = Get.find<UserSignupController>();
  final loginController = Get.put(LoginController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Great to see you here!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 05),
          const Text(
            'Tell us a little about yourself',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffB5B5B5),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '(+977) ${box.read('mobileNumber')}',
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Icon(Icons.check_circle_rounded, color: Colors.green)
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldWidegt(
            labelText: 'Name',
            prefixIcon: Icons.person_2_rounded,
            controller: userSignupController.nameController.value,
          ),
          const SizedBox(height: 20),
          TextFormFieldWidegt(
            prefixIcon: Icons.wc_rounded,
            labelText: 'Gender',
            controller: userSignupController.genderController.value,
          ),
          const SizedBox(height: 20),
          TextFormFieldWidegt(
            labelText: 'Age',
            prefixIcon: Icons.cake_rounded,
            controller: userSignupController.ageController.value,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormFieldWidegt(
                  labelText: 'Height',
                  prefixIcon: Icons.height_rounded,
                  controller: userSignupController.heightController.value,
                ),
              ),
              const SizedBox(width: 05),
              Expanded(
                child: TextFormFieldWidegt(
                  labelText: 'Weight',
                  prefixIcon: Icons.monitor_weight_rounded,
                  controller: userSignupController.weightController.value,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormFieldWidegt(
            labelText: 'Occupation',
            prefixIcon: Icons.shopping_bag_rounded,
            controller: userSignupController.occupationController.value,
          ),
          const SizedBox(height: 20),
          Obx(
            () => CheckboxListTile(
              value: userSignupController.hasHyperTension.value,
              onChanged: (value) {
                userSignupController.hasHyperTension.value = value!;
              },
              title: const Text(
                'Do You Have HyperTension ?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffB5B5B5),
                ),
              ),
            ),
          ),
        ],
      ),
    ).marginOnly(left: 10, right: 10, top: 40);
  }
}
