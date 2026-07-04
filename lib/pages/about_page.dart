import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/data/site_data.dart';

import '../widgets/footer.dart';
import '../widgets/navbar.dart' as nav;

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About ${SiteData.companyName}',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Independent Flutter development studio',
                style: TextStyle(fontSize: 18, color: Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 40),
              _section(
                'Who I Am',
                'I\'m ${SiteData.founderName}, the developer behind ${SiteData.companyName}. '
                    'I build and publish mobile applications for Android and iOS using Flutter and Dart. '
                    'What started as a passion for creating useful tools has grown into a portfolio of apps '
                    'used by tens of thousands of people across finance, productivity, health, and education categories.',
              ),
              _section(
                'What We Do',
                '${SiteData.companyName} is a one-person development studio focused on practical, '
                    'well-designed applications. I handle the entire product lifecycle: researching user needs, '
                    'designing interfaces, writing code, integrating backend services like Firebase, '
                    'testing on real devices, and publishing to the Google Play Store with ongoing updates and support.',
              ),
              _section(
                'Development Philosophy',
                'Every app I ship follows a few core principles:\n\n'
                    '• Solve a real problem — calculators, trackers, and reminders should save people time or money.\n'
                    '• Work offline when possible — not everyone has reliable internet.\n'
                    '• Respect privacy — collect only what is necessary and be transparent about data use.\n'
                    '• Perform on mid-range devices — smooth scrolling and fast startup on budget phones.\n'
                    '• Maintain actively — regular updates, bug fixes, and Play Store compliance.',
              ),
              _section(
                'Technical Expertise',
                'My primary stack is Flutter & Dart for cross-platform UI, combined with Firebase for '
                    'authentication, cloud storage, and push notifications. I integrate REST APIs, Bluetooth Low Energy '
                    'for IoT devices, MQTT messaging, and local databases (Hive, SQLite) for offline-first apps.\n\n'
                    'I also build companion web experiences — like this site — using Flutter Web, deployed on Firebase Hosting.',
              ),
              _section(
                'Published Apps',
                'My Play Store portfolio includes TrackGoldPro (gold price tracking), LoanBee (EMI calculator), '
                    'BuildCalc (construction calculator), FemGlow (period tracker), Memo Keeper (notes & reminders), '
                    'NexCalc (scientific calculator), and Learn Flutter & Dart (educational app). '
                    'Each app is maintained independently with user feedback driving the roadmap.',
              ),
              _section(
                'Work With Me',
                'I take on freelance Flutter projects — MVPs, app redesigns, Firebase integrations, and Play Store launches. '
                    'If you have a project in mind, visit the Contact page or email me directly at ${SiteData.email}. '
                    'I typically respond within 24–48 hours.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFCBD5E1),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
