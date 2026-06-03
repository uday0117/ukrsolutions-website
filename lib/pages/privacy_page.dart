import 'package:flutter/material.dart';
import '../widgets/navbar.dart' as nav;
import '../widgets/footer.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

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
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
            vertical: isMobile ? 60 : 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Header
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Last updated: ${DateTime.now().toString().split(' ')[0]}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 40),
              
              // Introduction
              _buildSection(
                'Introduction',
                'At UKR Solutions, we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile applications and services.',
              ),
              
              _buildSection(
                'Information We Collect',
                'We may collect information about you in various ways. The information we may collect via our apps includes:\n\n'
                '• Personal Data: Name, email address, and other contact information you voluntarily provide\n'
                '• Usage Data: Information about how you use our apps, including features accessed and time spent\n'
                '• Device Data: Information about your mobile device, including model, operating system, and unique device identifiers',
              ),
              
              _buildSection(
                'How We Use Your Information',
                'We use the information we collect to:\n\n'
                '• Provide, maintain, and improve our services\n'
                '• Process your requests and transactions\n'
                '• Send you technical notices and support messages\n'
                '• Respond to your comments and questions\n'
                '• Monitor and analyze trends, usage, and activities\n'
                '• Detect, prevent, and address technical issues',
              ),
              
              _buildSection(
                'Data Security',
                'We implement appropriate technical and organizational security measures to protect your personal information. However, no method of transmission over the Internet or electronic storage is 100% secure.',
              ),
              
              _buildSection(
                'Third-Party Services',
                'Our apps may contain links to third-party websites or services. We are not responsible for the privacy practices of these third parties. We encourage you to review their privacy policies.',
              ),
              
              _buildSection(
                'Children\'s Privacy',
                'Our services are not intended for children under the age of 13. We do not knowingly collect personal information from children under 13.',
              ),
              
              _buildSection(
                'Changes to This Privacy Policy',
                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.',
              ),
              
              _buildSection(
                'Contact Us',
                'If you have any questions about this Privacy Policy, please contact us at:\n\n'
                'Email: apps.uksolutions@gmail.com\n'
                'Website: ukrsolutions.in',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, String content) {
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
            content,
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
