import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension/app/data/models/user_signup_model.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class UserSignupController extends GetxController {
  final box = GetStorage();

  RxBool hasHyperTension = false.obs;

  final nameController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final occupationController = TextEditingController().obs;

  // Firebase Instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser() async {
    final name = nameController.value.text.trim();
    final gender = genderController.value.text.trim();
    final age = ageController.value.text.trim();
    final height = heightController.value.text.trim();
    final weight = weightController.value.text.trim();
    final occupation = occupationController.value.text.trim();

    final User? user = auth.currentUser;
    final String uid = user!.uid;
    if (name.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
    } else if (gender.isEmpty) {
      Get.snackbar('Error', 'Please enter your gender');
    } else if (age.isEmpty) {
      Get.snackbar('Error', 'Please enter your gender');
    } else if (height.isEmpty) {
      Get.snackbar('Error', 'Please enter your height');
    } else if (weight.isEmpty) {
      Get.snackbar('Error', 'Please enter your weight');
    } else if (occupation.isEmpty) {
      Get.snackbar('Error', 'Please enter your occupation');
    } else {
      final userModel = UserSignupModel(
        name: name,
        gender: gender,
        age: int.tryParse(age),
        height: double.tryParse(height),
        weight: double.tryParse(weight),
        occupation: occupation,
        hasHyperTension: hasHyperTension.value,
        phone: box.read('mobileNumber'),
        uid: uid,
        date: DateTime.now().toString(),
      );
      await firestore.collection('users').doc(uid).set(userModel.toJson());
      nameController().clear();
      genderController().clear();
      ageController().clear();
      heightController().clear();
      weightController().clear();
      occupationController().clear();
      Get.offAllNamed(NameRoutes.homepageScreen);
    }
  }
}
