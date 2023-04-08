import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/05_view_report_controller/view_report_controller.dart';

class ViewReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewReportController());
  }
}
