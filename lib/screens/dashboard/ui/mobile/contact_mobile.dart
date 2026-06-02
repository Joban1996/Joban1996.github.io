import 'package:flutter/material.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: Colors.blue.shade900,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      child: Column(
        children: [
          // Title
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 60,
            height: 3,
            color: Colors.white,
          ),
          const SizedBox(height: 30),

          // Subtitle
          Text(
            'I\'m currently looking for new opportunities. Whether you have a question or just want to say hi, I\'ll get back to you!',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Contact Cards - Responsive Layout
          isMobile
              ? Column(
            children: [
              _contactCard(
                Icons.email_outlined,
                'Email',
                'jobanmatharoo39@gmail.com',
                'mailto:jobanmatharoo39@gmail.com',
                isMobile,
              ),
              const SizedBox(height: 16),
              _contactCard(
                Icons.phone_outlined,
                'Phone',
                '+91 9041247534',
                'tel:+919041247534',
                isMobile,
              ),
              const SizedBox(height: 16),
              _contactCard(
                Icons.location_on_outlined,
                'Location',
                'Mohali, Punjab',
                '',
                isMobile,
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _contactCard(
                  Icons.email_outlined,
                  'Email',
                  'jobanmatharoo39@gmail.com',
                  'mailto:jobanmatharoo39@gmail.com',
                  isMobile,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _contactCard(
                  Icons.phone_outlined,
                  'Phone',
                  '+91 9041247534',
                  'tel:+919041247534',
                  isMobile,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _contactCard(
                  Icons.location_on_outlined,
                  'Location',
                  'Mohali, Punjab',
                  '',
                  isMobile,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // Divider
          Divider(color: Colors.white.withOpacity(0.2)),

          const SizedBox(height: 20),

          // Copyright
          Text(
            '© 2026 Jobandeep Singh. All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactCard(IconData icon, String title, String value, String link, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: isMobile ? 28 : 40, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}