import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/dashboard_controller.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/02_profile_controller/profile_controller.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ProfileController());
  }
}
