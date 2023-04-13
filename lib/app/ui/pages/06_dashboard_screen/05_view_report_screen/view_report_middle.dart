import 'package:flutter/material.dart';

class ViewReportMiddle extends StatelessWidget {
  const ViewReportMiddle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'BP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'PR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
