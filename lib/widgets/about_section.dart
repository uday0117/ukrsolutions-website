import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';
import 'package:ukr_solutions_website/widgets/animated_reveal.dart';
import 'package:ukr_solutions_website/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
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
              const AnimatedReveal(
                child: SectionHeader(
                  badge: 'SERVICES',
                  title: 'My Expertise',
                  subtitle:
                      'Technologies and solutions I work with every day',
                ),
              ),
              SizedBox(height: isMobile ? 40 : 56),

              // Services Grid
              if (isMobile)
                Column(children: _buildServiceCards())
              else
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: _buildServiceCards(),
                ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildServiceCards() {
    return [
      _ServiceCard(
        icon: Icons.flutter_dash,
        title: 'Flutter Development',
        description:
            'Cross-platform Android, iOS, Web and Desktop applications.',
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
        ),
      ),

      _ServiceCard(
        icon: Icons.bluetooth,
        title: 'IoT & Bluetooth',
        description:
            'Device communication, MQTT, BLE integration and smart systems.',
        gradient: const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF059669)],
        ),
      ),

      _ServiceCard(
        icon: Icons.cloud,
        title: 'Firebase & APIs',
        description:
            'Authentication, cloud storage, push notifications and REST APIs.',
        gradient: const LinearGradient(
          colors: [Color(0xFF06B6D4), Color(0xFF0891B2)],
        ),
      ),

      _ServiceCard(
        icon: Icons.psychology,
        title: 'AI Powered Apps',
        description:
            'AI tools, automation, productivity applications and smart workflows.',
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
      ),

      _ServiceCard(
        icon: Icons.rocket_launch,
        title: 'Play Store Publishing',
        description: 'Publishing, ASO optimization and app release management.',
        gradient: const LinearGradient(
          colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
        ),
      ),

      _ServiceCard(
        icon: Icons.design_services,
        title: 'UI/UX Design',
        description: 'Modern interfaces focused on usability and performance.',
        gradient: const LinearGradient(
          colors: [Color(0xFFEC4899), Color(0xFFDB2777)],
        ),
      ),
    ];
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Gradient gradient;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: 280,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: isHovered ? 0.08 : 0.04),
              Colors.white.withValues(alpha: 0.01),
            ],
          ),
          border: Border.all(
            color: isHovered
                ? AppTheme.accentBlue.withValues(alpha: 0.45)
                : Colors.white.withValues(alpha: 0.1),
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.accentBlue.withValues(alpha: 0.15),
                    blurRadius: 24,
                    spreadRadius: -4,
                  ),
                ]
              : null,
        ),
        transform: isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: widget.gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(widget.icon, size: 32, color: Colors.white),
            ),
            const SizedBox(height: 24),

            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF94A3B8),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
