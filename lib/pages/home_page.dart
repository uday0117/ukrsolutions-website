import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/widgets/featured_apps_section.dart';
import 'package:ukr_solutions_website/widgets/mesh_background.dart';
import 'package:ukr_solutions_website/widgets/stats_section.dart';

import '../widgets/about_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/intro_section.dart';
import '../widgets/navbar.dart' as nav;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MeshBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const nav.NavigationBar(),
              const HeroSection(),
              const IntroSection(),
              const StatsSection(),
              const FeaturedAppsSection(),
              const AboutSection(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
