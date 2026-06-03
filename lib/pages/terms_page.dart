import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/navbar.dart' as nav;

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

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
                'Terms & Conditions',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Last updated: ${DateTime.now().toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 40),

              // Introduction
              _buildSection(
                'Agreement to Terms',
                'By accessing or using our mobile applications and services, you agree to be bound by these Terms and Conditions. If you disagree with any part of these terms, you may not access our services.',
              ),

              _buildSection(
                'Use License',
                'Permission is granted to temporarily use our apps for personal, non-commercial use only. This license does not include:\n\n'
                    '• Modifying or copying the app materials\n'
                    '• Using the materials for commercial purposes\n'
                    '• Attempting to decompile or reverse engineer any software\n'
                    '• Removing any copyright or proprietary notations\n'
                    '• Transferring the materials to another person',
              ),

              _buildSection(
                'User Accounts',
                'When you create an account with us, you must provide accurate, complete, and current information. Failure to do so constitutes a breach of the Terms. You are responsible for safeguarding your account credentials and for any activities or actions under your account.',
              ),

              _buildSection(
                'Intellectual Property',
                'The apps and their original content, features, and functionality are owned by UKR Solutions and are protected by international copyright, trademark, patent, trade secret, and other intellectual property laws.',
              ),

              _buildSection(
                'User Content',
                'Our apps may allow you to create, submit, or share content. You retain ownership of your content, but you grant us a worldwide, non-exclusive, royalty-free license to use, reproduce, and distribute your content in connection with our services.',
              ),

              _buildSection(
                'Prohibited Uses',
                'You agree not to use our apps:\n\n'
                    '• In any way that violates any applicable law or regulation\n'
                    '• To exploit, harm, or attempt to exploit or harm minors\n'
                    '• To transmit any advertising or promotional material\n'
                    '• To impersonate or attempt to impersonate the company or another user\n'
                    '• In any way that infringes upon the rights of others',
              ),

              _buildSection(
                'Disclaimer',
                'Our apps are provided on an "AS IS" and "AS AVAILABLE" basis. We make no warranties, expressed or implied, regarding the operation or availability of our apps or the information, content, or materials included therein.',
              ),

              _buildSection(
                'Limitation of Liability',
                'In no event shall UKR Solutions, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential, or punitive damages arising out of your use of our apps.',
              ),

              _buildSection(
                'Termination',
                'We may terminate or suspend your account and access to our apps immediately, without prior notice or liability, for any reason, including breach of these Terms.',
              ),

              _buildSection(
                'Changes to Terms',
                'We reserve the right to modify or replace these Terms at any time. We will provide notice of any significant changes by posting the new Terms on this page and updating the "Last updated" date.',
              ),

              _buildSection(
                'Contact Us',
                'If you have any questions about these Terms and Conditions, please contact us at:\n\n'
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
