import 'package:flutter/material.dart';

import '../widgets/app_card.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart' as nav;

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const nav.NavigationBar(),
            _buildContent(context),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final List<Map<String, dynamic>> apps = [
      {
        'name': 'DocFlow',
        'description':
            'PDF tools, merge, split, compress and document management.',
        'icon': Icons.description,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.docflow',
        'primary': const Color(0xFF3B82F6),
        'secondary': const Color(0xFF10B981),
      },
      {
        'name': 'DocSnap',
        'description': 'Document scanning and PDF generation.',
        'icon': Icons.document_scanner,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.docsnap',
        'primary': const Color(0xFF10B981),
        'secondary': const Color(0xFF06B6D4),
      },
      {
        'name': 'BuildCalc',
        'description': 'Construction and engineering calculations.',
        'icon': Icons.calculate,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.buildcalc',
        'primary': const Color(0xFFF59E0B),
        'secondary': const Color(0xFFD97706),
      },
      {
        'name': 'FemGlow',
        'description': 'Period and cycle tracking application.',
        'icon': Icons.favorite,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.femglow',
        'primary': const Color(0xFFEC4899),
        'secondary': const Color(0xFFDB2777),
      },
      {
        'name': 'Memo Keeper',
        'description': 'Notes and productivity application.',
        'icon': Icons.note_alt,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.memokeeper',
        'primary': const Color(0xFF6366F1),
        'secondary': const Color(0xFF8B5CF6),
      },
      {
        'name': 'Learn Flutter & Dart',
        'description': 'Educational Flutter learning application.',
        'icon': Icons.school,
        'url':
            'https://play.google.com/store/apps/details?id=com.uksolutions.learnflutter',
        'primary': const Color(0xFF06B6D4),
        'secondary': const Color(0xFF3B82F6),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
            vertical: isMobile ? 60 : 100,
          ),
          child: Column(
            children: [
              Text(
                'Apps I\'ve Built',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 36 : (isTablet ? 44 : 56),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: isMobile ? 12 : 16),

              Text(
                'A collection of Flutter applications published on Google Play Store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  color: const Color(0xFF94A3B8),
                ),
              ),

              SizedBox(height: isMobile ? 40 : 60),

              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: apps.map((app) {
                  return SizedBox(
                    width: isMobile ? double.infinity : (isTablet ? 320 : 360),
                    child: AppCardWidget(
                      appName: app['name'],
                      description: app['description'],
                      icon: app['icon'],
                      playStoreUrl: app['url'],
                      primaryColor: app['primary'],
                      secondaryColor: app['secondary'],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 80),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.rocket_launch,
                      size: 48,
                      color: Color(0xFF3B82F6),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'More Apps In Development',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Continuously building Flutter applications and digital products.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
