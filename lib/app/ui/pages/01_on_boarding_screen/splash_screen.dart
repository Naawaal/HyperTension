import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/controllers/01_on_boarding_controllers/splash_controller.dart';

import 'package:hypertension/app/ui/global_widgets/on_boarding_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final onBoardingController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => LiquidSwipe(
              initialPage: onBoardingController.currentPage.value,
              liquidController: onBoardingController.controller.value,
              waveType: WaveType.liquidReveal,
              onPageChangeCallback: (page) {
                onBoardingController.moveToNextPage(page);
              },
              pages: [
                OnBoardingPage(
                  imagePath: 'stress1',
                  title: 'Welcome to HyperTesnion App',
                  subTitle: 'Managing Hypertension Has Never Been Easier',
                  pageNumber: '1',
                  description:
                      'Our app is designed to help you keep track of your blood pressure readings and provide you with helpful tips to manage your hypertension.',
                  backgroundColor: const Color(0xffECF2FF),
                ),
                OnBoardingPage(
                  imagePath: 'stress2',
                  title: ' Keep Track of Your Blood Pressure',
                  subTitle: 'Monitor Your Health Progress',
                  pageNumber: '2',
                  description:
                      'With our easy-to-use interface, you can log your blood pressure readings and track your progress over time. This will help you and your healthcare provider make informed decisions about your health.',
                  backgroundColor: const Color(0xffE3DFFD),
                ),
                OnBoardingPage(
                  imagePath: 'stress3',
                  title: 'Stay Informed',
                  subTitle: 'Learn About Hypertension',
                  pageNumber: '3',
                  description:
                      'Our app provides you with the latest information about hypertension, including tips for managing your blood pressure and strategies for living a healthy lifestyle. We want to empower you with the knowledge you need to take control of your health.',
                  backgroundColor: const Color(0xffE5D1FA),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 3; i++)
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width:
                          onBoardingController.currentPage.value == i ? 20 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: onBoardingController.currentPage.value == i
                            ? const Color(0xff3F51B5)
                            : const Color(0xff3F51B5).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible:
                  onBoardingController.currentPage.value != 2 ? true : false,
              child: Positioned(
                top: 30,
                right: 10,
                child: TextButton(
                  onPressed: () => onBoardingController.onSkipButtonPressed(),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xff3F51B5),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible:
                  onBoardingController.currentPage.value != 0 ? true : false,
              child: Positioned(
                bottom: 20,
                left: 20,
                child: TextButton(
                  onPressed: () => onBoardingController.onBackButtonPressed(),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Color(0xff3F51B5),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: OutlinedButton(
              onPressed: () => onBoardingController.onNextButtonPressed(),
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(
                  color: Color(0xff3F51B5),
                ),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff3F51B5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
