import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypertension/app/ui/utils/text_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutHyperTensionMiddle extends StatelessWidget {
  const AboutHyperTensionMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://health.clevelandclinic.org/wp-content/uploads/sites/3/2021/12/WhenToTakeBloodPressure-1315124406-770x533-1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            textAlign: TextAlign.justify,
            aboutHyperTension,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.justify,
            'HyperTension Symptoms',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://www.lalpathlabs.com/blog/wp-content/uploads/2022/10/Picture8.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.justify,
            aboutHyperTensionSymptoms,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.justify,
            'What are some ways to avoid developing hypertension?',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/005/611/451/original/man-measuring-patient-blood-pressure-checking-arterial-blood-pressure-digital-device-tonometer-healthcare-concept-flat-style-cartoon-illustration-free-vector.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            textAlign: TextAlign.justify,
            avoidHyperTension,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'For more information, visit ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text:
                  'https://www.who.int/news-room/fact-sheets/detail/hypertension',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(Uri(
                      scheme: 'https',
                      host: 'www.who.int',
                      path: 'news-room/fact-sheets/detail/hypertension'));
                },
            ),
          ])),
        ],
      ),
    );
  }
}
