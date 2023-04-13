import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/05_homepage_controller/01_dashboard_controller/05_view_report_controller/view_report_controller.dart';
import 'package:hypertension/app/data/models/daily_check_model.dart';

class ViewReportTop extends StatelessWidget {
  ViewReportTop({super.key});

  final viewReportController = Get.put(ViewReportController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DailyCheckModel>(
      future: viewReportController.fetchDailyChecks(),
      builder: (context, AsyncSnapshot<DailyCheckModel> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 200,
                    child: Obx(
                      () => DChartBar(
                        data: [
                          {
                            'id': 'Diastolic BP',
                            'data': List.generate(
                              viewReportController.dateList.length,
                              (index) => {
                                'domain': viewReportController.dateList[index],
                                'measure': viewReportController.bpList[index],
                              },
                            ),
                          },
                          {
                            'id': 'Systolic BP',
                            'data': List.generate(
                              viewReportController.dateList.length,
                              (index) => {
                                'domain': viewReportController.dateList[index],
                                'measure': viewReportController.prList[index],
                              },
                            ),
                          }
                        ],
                        domainLabelPaddingToAxisLine: 10,
                        axisLineTick: 2,
                        axisLinePointTick: 2,
                        axisLinePointWidth: 10,
                        axisLineColor: Colors.green,
                        measureLabelPaddingToAxisLine: 10,
                        barColor: (barData, index, id) => id == 'Systolic BP'
                            ? Colors.red
                            : Colors.blue, // customize the bar colors
                        showBarValue: true,
                        animate: true,
                        showDomainLine: true,
                        showMeasureLine: true,
                        xAxisTitle: 'Date',
                        yAxisTitle: 'BP / PR',
                        barValuePosition: BarValuePosition.auto,
                        verticalDirection: true,
                        domainLabelPaddingToTick: 10,
                        animationDuration: 3.seconds,
                        barValueAnchor: BarValueAnchor.end,
                        barValueColor: Colors.deepPurple,
                        barValue: (barData, index) {
                          return '${barData['measure']}';
                        },
                        barValueFontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
