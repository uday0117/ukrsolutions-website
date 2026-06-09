import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/widgets/featured_apps_section.dart';
import 'package:ukr_solutions_website/widgets/stats_section.dart';

import '../widgets/about_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart' as nav;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const nav.NavigationBar(),
            const HeroSection(),
            const StatsSection(),
            const FeaturedAppsSection(),

            const AboutSection(),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
