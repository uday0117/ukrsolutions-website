import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/data/app_data.dart';
import 'package:ukr_solutions_website/widgets/app_card.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
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
                children: AppData.apps.map((app) {
                  return SizedBox(
                    width: isMobile ? double.infinity : (isTablet ? 320 : 360),
                    child: AppCardWidget(
                      appName: app.name,
                      description: app.description,
                      icon: app.icon,
                      playStoreUrl: app.playStoreUrl,
                      primaryColor: app.primaryColor,
                      secondaryColor: app.secondaryColor,
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
