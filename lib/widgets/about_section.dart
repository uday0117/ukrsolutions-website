import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';

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
              // Section Header
              Text(
                'My Expertise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 32 : (isTablet ? 40 : 48),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Technologies and solutions I work with every day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              SizedBox(height: isMobile ? 40 : 60),

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
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? const Color(0xFF3B82F6).withOpacity(0.5)
                : Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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
