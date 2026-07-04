import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? badge;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (badge != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6366F1).withValues(alpha: 0.25),
                  const Color(0xFF06B6D4).withValues(alpha: 0.15),
                ],
              ),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: const Color(0xFF6366F1).withValues(alpha: 0.35),
              ),
            ),
            child: Text(
              badge!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF818CF8),
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFF8FAFC), Color(0xFFCBD5E1)],
          ).createShader(bounds),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.15,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF94A3B8),
              height: 1.65,
            ),
          ),
        ),
      ],
    );
  }
}
