import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/05_view_report_controller/view_report_controller.dart';

class ViewReportTop extends StatelessWidget {
  ViewReportTop({super.key});

  final viewReportController = Get.put(ViewReportController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewReportController.fetchDailyChecks(),
      builder: (context, snapshot) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: 200,
              child: Obx(
                () => DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': List.generate(
                        viewReportController.dateList.length,
                        (index) => {
                          'domain': viewReportController.dateList[index],
                          'measure': viewReportController.bpList[index],
                        },
                      ),
                    },
                  ],
                  domainLabelPaddingToAxisLine: 10,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 10,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                  animate: true,
                  xAxisTitle: 'Date',
                  yAxisTitle: 'Blood Pressure',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
