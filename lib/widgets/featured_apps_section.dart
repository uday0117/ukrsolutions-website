import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/responsive.dart';
import '../data/app_data.dart';

class FeaturedAppsSection extends StatelessWidget {
  const FeaturedAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Featured Applications',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'Apps published by UKR Solutions',
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
            children: AppData.apps.take(3).map((app) {
              return Container(
                width: isMobile ? double.infinity : 320,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Icon(app.icon, size: 56, color: app.primaryColor),

                    const SizedBox(height: 20),

                    Text(
                      app.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      app.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF94A3B8),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed:
                          app.playStoreUrl == null || app.playStoreUrl!.isEmpty
                          ? null
                          : () async {
                              final uri = Uri.parse(app.playStoreUrl!);

                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: app.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                      child: const Text('View App'),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
