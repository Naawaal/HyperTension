import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';

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
    if (user != null) {
      Get.offNamed(NameRoutes.homepageScreen);
    } else {
      Get.offNamed(NameRoutes.loginScreen);
    }
  }
}
