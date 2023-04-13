import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color backgroundColor;
  final String subTitle;
  final String description;
  final String pageNumber;

  const OnBoardingPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.pageNumber,
    required this.description,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width * 0.7,
            height: Get.height * 0.3,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/$imagePath.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            '$pageNumber/3',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
