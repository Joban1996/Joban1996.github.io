import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: Colors.white,
      child: Column(
        children: [
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
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile) ...[
                Expanded(
                  child: _buildInfoCard(
                    'Experience',
                    '5+ Years',
                    'Flutter Development',
                    Icons.work_outline,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildInfoCard(
                    'Projects',
                    '10+',
                    'Apps Delivered',
                    Icons.apps_outlined,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildInfoCard(
                    'Clients',
                    '5+',
                    'Happy Clients',
                    Icons.people_outline,
                  ),
                ),
              ] else ...[
                _buildInfoCard(
                  'Experience',
                  '5+ Years',
                  'Flutter Development',
                  Icons.work_outline,
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  'Projects',
                  '10+',
                  'Apps Delivered',
                  Icons.apps_outlined,
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  'Clients',
                  '5+',
                  'Happy Clients',
                  Icons.people_outline,
                ),
              ],
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'I\'m a passionate Flutter developer with 5+ years of experience building high-quality cross-platform apps. '
                'I specialize in creating beautiful, performant mobile applications with clean architecture. '
                'I\'ve built full-stack applications using FastAPI and MongoDB, and I\'m experienced with CI/CD pipelines.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}