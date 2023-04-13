import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, setInitialView);
  }

  var currentPage = 0.obs;

  final controller = LiquidController().obs;

  setInitialView(User? user) {
    // firestore
    //     .collection('users')
    //     .doc(user!.uid)
    //     .get()
    //     .then((DocumentSnapshot doc) {
    //   if (doc.exists) {
    //     Get.offNamed(NameRoutes.homepageScreen);
    //   } else {
    //     Get.offNamed(NameRoutes.loginScreen);
    //   }
    // });
    // if (user != null) {
    //   Get.offNamed(NameRoutes.homepageScreen);
    // } else {
    //   Get.offNamed(NameRoutes.loginScreen);
    // }
  }

  void onBackButtonPressed() {
    if (currentPage.value == 2) {
      controller.value.jumpToPage(page: 1);
    } else {
      controller.value.jumpToPage(page: 0);
    }
  }

  void onNextButtonPressed() {
    if (currentPage.value == 2) {
      Get.offAllNamed('/login');
    } else {
      controller.value.jumpToPage(page: currentPage.value + 1);
    }
  }

  void onSkipButtonPressed() {
    controller.value.jumpToPage(page: 2);
  }
}
