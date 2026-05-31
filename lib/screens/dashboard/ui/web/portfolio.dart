import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  onImageTap: () => _showFullImage(context, project['image']),
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
  final VoidCallback onImageTap;

  const _ProjectCard({Key? key, required this.project, required this.onImageTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          // Image Section - Tap to see full image
          GestureDetector(
            onTap: onImageTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 160,
                width: double.infinity,
                color: Colors.blue.shade50,
                child: _buildImage(project['image']),
              ),
            ),
          ),

          // Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project['role'],
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      project['description'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: (project['tech'] as List).take(4).map((tech) =>
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const Center(
        child: Icon(Icons.code, size: 50, color: Colors.blue),
      );
    }

    return Image.asset(
      imagePath,
      width: double.infinity,
      height: 160,
      fit: BoxFit.contain,
    );
  }
}