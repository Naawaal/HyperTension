import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, setInitialView);
  }

  setInitialView(User? user) {
    if (user == null) {
      Get.offAllNamed(NameRoutes.loginScreen);
    } else {
      Get.offAllNamed(NameRoutes.homepageScreen);
    }
  }
}
