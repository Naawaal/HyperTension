import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/routes/names_routes.dart';
import 'package:hypertension/app/ui/global_widgets/container_widget.dart';

class DashBoardMiddle extends StatelessWidget {
  const DashBoardMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWidget(
          title: 'Blood Pressure',
          subTitle: 'Daily',
          titleColor: const Color(0xffFFA1A1),
          bgColor: const Color(0xffFFF5F0),
          subTitleColor: const Color(0xffFF0000),
          bSubTitile: 'Check',
          image: 'assets/hypertension.png',
          onTap: () {
            Get.toNamed(NameRoutes.dailyCheck);
          },
        ),
        const SizedBox(height: 10),
        ContainerWidget(
          title: 'Exercise',
          subTitle: 'Diet',
          titleColor: const Color(0xff8AC6AE),
          bgColor: const Color(0xffF0FFF9),
          subTitleColor: const Color(0xff00C677),
          bSubTitile: 'Plans',
          image: 'assets/diet.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ContainerWidget(
          title: 'Medication',
          subTitle: 'User',
          titleColor: const Color(0xffB681F2),
          bgColor: const Color(0xffF7F0FF),
          subTitleColor: const Color(0xff7200F4),
          bSubTitile: 'Assignments',
          image: 'assets/assignment.png',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ContainerWidget(
          title: 'Info',
          subTitle: 'About',
          titleColor: const Color(0xff81AEF2),
          bgColor: const Color(0xffE3F7FF),
          subTitleColor: const Color(0xff0053F4),
          bSubTitile: 'Hypertension',
          image: 'assets/list.png',
          onTap: () {
            Get.toNamed(NameRoutes.aboutHyperTension);
          },
        ),
        const SizedBox(height: 10),
        ContainerWidget(
          title: 'Chart',
          subTitle: 'View',
          titleColor: const Color(0xffD5E50A),
          bgColor: const Color(0xffFFFEE9),
          subTitleColor: const Color(0xffB0E014),
          bSubTitile: 'Report',
          image: 'assets/report.png',
          onTap: () {
            Get.toNamed(NameRoutes.viewReport);
          },
        ),
      ],
    );
  }
}
