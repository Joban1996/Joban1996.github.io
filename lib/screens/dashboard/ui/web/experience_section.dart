import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: 60,
      ),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          // Title
          Text(
            'Experience',
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
          const SizedBox(height: 50),

          // Experience Cards
          _buildExperienceCard(
            context,
            role: 'Sr. Flutter Developer',
            company: 'Alphalt Technologies Inc.',
            location: 'Mohali, Punjab',
            duration: 'June 2025 - Present',
            achievements: [
              'Built production Flutter apps with CI/CD pipelines',
              'Integrated payment gateways and real-time chat',
              'Managed app releases on Play Store',
            ],
            isMobile: isMobile,
          ),

          const SizedBox(height: 24),

          _buildExperienceCard(
            context,
            role: 'Flutter Developer',
            company: 'Megamind Creations',
            location: 'Mohali, Punjab',
            duration: 'May 2023 - June 2025',
            achievements: [
              'Developed and published multiple Flutter apps',
              'Built apps including dating and marketplace platforms',
              'Worked with Firebase, REST APIs, and push notifications',
            ],
            isMobile: isMobile,
          ),

          const SizedBox(height: 24),

          _buildExperienceCard(
            context,
            role: 'Flutter Developer, Android Developer',
            company: 'Seasia Infotech Ltd.',
            location: 'Mohali, Punjab',
            duration: 'June 2020 - May 2023',
            achievements: [
              'Developed Flutter and Android apps for various clients',
              'Worked across multiple domains and app types',
              'Learned and grew from junior to mid-level developer',
            ],
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
      BuildContext context, {
        required String role,
        required String company,
        required String location,
        required String duration,
        required List<String> achievements,
        required bool isMobile,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row: Role + Duration (Responsive)
          isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  duration,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  role,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  duration,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Company + Location
          Text(
            company,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            location,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 12),

          // Achievements
          ...achievements.map((achievement) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    achievement,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}