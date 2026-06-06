import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/portfolio_controller.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding = screenWidth < 600 ? 20 : (screenWidth < 1000 ? 60 : 100);
    final crossAxisCount = screenWidth < 600 ? 1 : 2;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(width: 60, height: 3, color: Colors.blue),
          const SizedBox(height: 50),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                mainAxisExtent: 380,
              ),
              itemCount: controller.projects.length,
              itemBuilder: (context, index) {
                final project = controller.projects[index];
                return _ProjectCard(
                  project: project,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Show full image with close button
  void _showFullImage(BuildContext context, String? imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            // Image Container
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _buildFullImage(imagePath),
                ),
              ),
            ),
            // ✅ Close Button (Top Right)
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return Container(
        height: 300,
        width: 300,
        color: Colors.blue.shade50,
        child: const Center(
          child: Icon(Icons.code, size: 80, color: Colors.blue),
        ),
      );
    }

    return Image.asset(
      imagePath,
      height: MediaQuery.of(Get.context!).size.height * 0.7,
      width: MediaQuery.of(Get.context!).size.width * 0.9,
      fit: BoxFit.contain,
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;

  const _ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasLiveUrl = project['liveUrl'] != null && project['liveUrl'].toString().isNotEmpty;
    final hasGithubUrl = project['githubUrl'] != null && project['githubUrl'].toString().isNotEmpty;

    return Container(
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
          // Content Section (takes available space)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    project['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),

                  // Role
                  Text(
                    project['role'],
                    style: TextStyle(fontSize: 13, color: Colors.blue.shade700),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    project['description'],
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.5),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Tech Stack
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (project['tech'] as List).map((tech) =>
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(fontSize: 12, color: Colors.blue.shade700),
                          ),
                        ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Button at Bottom
          if (hasLiveUrl || hasGithubUrl)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (hasLiveUrl) {
                      _launchUrl(project['liveUrl']);
                    } else if (hasGithubUrl) {
                      _launchUrl(project['githubUrl']);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasLiveUrl ? Colors.blue : Colors.grey.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    hasLiveUrl ? 'View Application' : 'View Code',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar('Error', 'Could not open link');
    }
  }
}