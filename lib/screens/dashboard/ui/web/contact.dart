import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: Colors.blue.shade900,
      child: Column(
        children: [
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
          const SizedBox(height: 40),
          Text(
            'I\'m currently looking for new opportunities. Whether you have a question or just want to say hi, I\'ll get back to you!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _contactCard(
                context,
                Icons.email_outlined,
                'Email',
                'jobanmatharoo39@gmail.com',
                'mailto:jobanmatharoo39@gmail.com',
              ),
              if (!isMobile) const SizedBox(width: 30),
              _contactCard(
                context,
                Icons.phone_outlined,
                'Phone',
                '+91 9041247534',
                'tel:+919041247534',
              ),
              if (!isMobile) const SizedBox(width: 30),
              _contactCard(
                context,
                Icons.location_on_outlined,
                'Location',
                'Mohali, Punjab',
                '',
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
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

  Widget _contactCard(BuildContext context, IconData icon, String title, String value, String link) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}