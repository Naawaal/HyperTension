import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/01_daily_check_controller/daily_check_controller.dart';

class DailyCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DailyCheckController());
  }
}
