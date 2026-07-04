import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/data/app_data.dart';
import 'package:ukr_solutions_website/widgets/animated_reveal.dart';
import 'package:ukr_solutions_website/widgets/app_card.dart';
import 'package:ukr_solutions_website/widgets/mesh_background.dart';
import 'package:ukr_solutions_website/widgets/section_header.dart';

import '../widgets/footer.dart';
import '../widgets/navbar.dart' as nav;

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MeshBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const nav.NavigationBar(),
              _buildContent(context),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final publishedApps = AppData.apps
        .where((a) => a.playStoreUrl != null && a.playStoreUrl!.isNotEmpty)
        .toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          const AnimatedReveal(
            child: SectionHeader(
              badge: 'PORTFOLIO',
              title: 'Apps I\'ve Built',
              subtitle:
                  'Tap any card to open on Google Play. Each app is crafted with Flutter for Android and iOS.',
            ),
          ),
          SizedBox(height: isMobile ? 40 : 56),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              for (var i = 0; i < publishedApps.length; i++)
                SizedBox(
                  width: isMobile ? double.infinity : (isTablet ? 340 : 380),
                  child: AppCardWidget(
                    appName: publishedApps[i].name,
                    description: publishedApps[i].description,
                    longDescription: publishedApps[i].longDescription,
                    features: publishedApps[i].features,
                    icon: publishedApps[i].icon,
                    playStoreUrl: publishedApps[i].playStoreUrl,
                    primaryColor: publishedApps[i].primaryColor,
                    secondaryColor: publishedApps[i].secondaryColor,
                  ).staggerIn(index: i),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
