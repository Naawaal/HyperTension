import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/ui/pages/06_dashboard_screen/dashboard_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<Widget> screensList = [
    DashboardScreen(),
    DashboardScreen(),
  ];
  final List<IconData> iconList = [
    Icons.category_rounded,
    Icons.person_4_rounded,
  ];
  var currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[currentScreen],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        elevation: 1,
        iconSize: 25,
        activeIndex: currentScreen,
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 22,
        rightCornerRadius: 22,
        activeColor: Colors.purple,
      ).marginOnly(left: 10, right: 10),
    );
  }
}
