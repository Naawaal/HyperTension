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
    ever(_user, checkAuth);
  }

  checkAuth(User? user) {
    if (user == null || user.uid.isEmpty) {
      Get.offNamed(NameRoutes.loginScreen);
    } else {
      firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((DocumentSnapshot doc) {
        if (doc.exists && doc.data() != null && user.uid.isNotEmpty) {
          Get.offNamed(NameRoutes.homepageScreen);
        } else {
          Get.offNamed(NameRoutes.userSignup);
        }
      });
    }
  }
}
