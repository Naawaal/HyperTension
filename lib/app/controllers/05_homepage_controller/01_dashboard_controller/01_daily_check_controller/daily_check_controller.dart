import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time/date_time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypertension/app/data/models/daily_check_model.dart';

class DailyCheckController extends GetxController {
  // Text Editing Controllers
  final bloodPressureController = TextEditingController().obs;
  final plusRateController = TextEditingController().obs;

// Bool to check if notification is enabled or not
  RxBool isNotificationTrue = false.obs;

  // Firebase Instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final box = GetStorage().obs;

  void calculateBPAndPR() {
    final bloodPressure =
        int.tryParse(bloodPressureController.value.text.trim());
    final plusRate = int.tryParse(plusRateController.value.text.trim());
    if (bloodPressure != null && plusRate != null) {
      final bp = (bloodPressure / 3).toStringAsFixed(0);
      final pr = (plusRate / 6).toStringAsFixed(0);
      Get.snackbar(
        'Result',
        'Blood Pressure: $bp\nPlus Rate: $pr',
        snackPosition: SnackPosition.TOP,
      );
      box.value.write('bp', bp);
      box.value.write('pr', pr);
    } else {
      Get.snackbar(
        'Error',
        'Please enter valid values',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> submitDailyCheck() async {
    if (bloodPressureController.value.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter valid values',
        snackPosition: SnackPosition.TOP,
      );
    } else if (plusRateController.value.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter valid values',
        snackPosition: SnackPosition.TOP,
      );
    } else {
      final dailyModel = DailyCheckModel(
          bp: int.tryParse(box.value.read('bp')),
          pr: int.tryParse(box.value.read('pr')),
          date: DateTime.now().date.toString());

      final user = auth.currentUser;

      final uid = user!.uid;

      final dailyCheckRef =
          firestore.collection('users').doc(uid).collection('dailyCheck');

      final querySnapshot = await dailyCheckRef
          .where('date', isEqualTo: DateTime.now().date.toString())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Get.snackbar('Message', 'You have already submitted your daily check');
      } else {
        final dailyCheckDocRef = await firestore
            .collection('users')
            .doc(uid)
            .collection('dailyCheck')
            .add(dailyModel.toJson());
        bloodPressureController().clear();
        plusRateController().clear();
        Get.snackbar(
          'Message',
          'Your daily check has been submitted',
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    final bool notificationEnabled =
        box.value.read('isNotificationEnabled') ?? false;
    isNotificationTrue.value = notificationEnabled;
  }

  Future<void> isNotificationEnabled(bool value) async {
    isNotificationTrue.value = value;
    await box.value.write('isNotificationEnabled', value);
    // update the UI
  }
}
