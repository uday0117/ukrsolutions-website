import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/core/routes.dart';
import 'package:ukr_solutions_website/data/app_data.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';
import 'package:ukr_solutions_website/widgets/animated_reveal.dart';
import 'package:ukr_solutions_website/widgets/app_card.dart';
import 'package:ukr_solutions_website/widgets/section_header.dart';

class FeaturedAppsSection extends StatelessWidget {
  const FeaturedAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final featured = AppData.apps
        .where((a) => a.playStoreUrl != null && a.playStoreUrl!.isNotEmpty)
        .take(3)
        .toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      child: AnimatedReveal(
        child: Column(
          children: [
            const SectionHeader(
              badge: 'PLAY STORE',
              title: 'Featured Apps',
              subtitle:
                  'Tap any card to open on Google Play — finance, productivity, and health tools built with Flutter.',
            ),
            SizedBox(height: isMobile ? 40 : 56),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                for (var i = 0; i < featured.length; i++)
                  SizedBox(
                    width: isMobile ? double.infinity : 340,
                    child: AppCardWidget(
                      appName: featured[i].name,
                      description: featured[i].description,
                      longDescription: featured[i].longDescription,
                      features: featured[i].features,
                      icon: featured[i].icon,
                      playStoreUrl: featured[i].playStoreUrl,
                      primaryColor: featured[i].primaryColor,
                      secondaryColor: featured[i].secondaryColor,
                    ).staggerIn(index: i),
                  ),
              ],
            ),
            const SizedBox(height: 40),
            TextButton.icon(
              onPressed: () => context.go(Routes.apps),
              icon: const Icon(Icons.grid_view_rounded, size: 18),
              label: const Text('View All Apps'),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.accentBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ).animate().fadeIn(delay: 400.ms),
          ],
        ),
      ),
    );
  }
}
