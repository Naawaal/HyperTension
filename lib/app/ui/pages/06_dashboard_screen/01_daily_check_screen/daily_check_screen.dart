import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/01_daily_check_controller/daily_check_controller.dart';
import 'package:hypertension/app/data/services/notification_services.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/01_daily_check_screen/daily_check_bottom.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/01_daily_check_screen/daily_check_middle.dart';

class DailyCheckScreen extends StatefulWidget {
  const DailyCheckScreen({super.key});

  @override
  State<DailyCheckScreen> createState() => _DailyCheckScreenState();
}

final dailyCheckController = Get.put(DailyCheckController());

class _DailyCheckScreenState extends State<DailyCheckScreen> {
  final notificationServices = NotificationsServices();
  @override
  void initState() {
    super.initState();
    notificationServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Check',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Obx(
            () {
              return IconButton(
                icon: Icon(
                  dailyCheckController.isNotificationTrue.value
                      ? Icons.notifications_active_rounded
                      : Icons.notifications_none_rounded,
                  color: dailyCheckController.isNotificationTrue.value
                      ? Colors.green
                      : Colors.grey,
                ),
                onPressed: () async {
                  await Get.defaultDialog(
                    title: 'Notification',
                    content: const Text('Do you want to enable notification ?'),
                    barrierDismissible: false,
                    radius: 14,
                    actions: [
                      TextButton(
                        onPressed: () {
                          dailyCheckController.isNotificationEnabled(false);
                          notificationServices.cancelNotification();
                          Get.back();
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await dailyCheckController
                              .isNotificationEnabled(true);
                          notificationServices.scheduleNotification();
                          Get.back();
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: DailyCheckMiddle().marginOnly(left: 10, right: 10),
      bottomNavigationBar: DailyCheckBottom(),
    );
  }
}
