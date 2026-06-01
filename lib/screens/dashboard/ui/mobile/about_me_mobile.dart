import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';

///About me part of dashboard screen
class AboutMeMobile extends StatelessWidget {
  ///Class constructor
  AboutMeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final screenWidth = Get.width;

    return Container(
      key: aboutSectionKey,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),

          Text(
            'About Me',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 60,
            height: 3,
            color: Colors.blue,
          ),

          SizedBox(height: screenHeight * 0.03),

          // Description Text
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              'I\'m a passionate Flutter developer with 5+ years of experience building high-quality cross-platform apps. '
                  'I specialize in creating beautiful, performant mobile applications with clean architecture. '
                  'I\'ve built full-stack applications using FastAPI and MongoDB, and I\'m experienced with CI/CD pipelines.',
              style: Get.textTheme.bodySmall!.copyWith(fontSize: 13, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _statCard('5+', 'Years', 'Experience'),
              const SizedBox(width: 16),
              _statCard('10+', 'Projects', 'Delivered'),
              const SizedBox(width: 16),
              _statCard('5+', 'Clients', 'Happy'),
            ],
          ),
          SizedBox(height: screenHeight * 0.06),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label, String subtitle) {
    return Container(
      width: 85,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}