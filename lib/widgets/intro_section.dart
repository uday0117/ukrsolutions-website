import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/core/routes.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';
import 'package:ukr_solutions_website/widgets/animated_reveal.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return AnimatedReveal(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
          vertical: isMobile ? 48 : 72,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Container(
              padding: EdgeInsets.all(isMobile ? 28 : 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.accentIndigo.withValues(alpha: 0.12),
                    AppTheme.accentCyan.withValues(alpha: 0.06),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building Useful Apps with Flutter',
                    style: TextStyle(
                      fontSize: isMobile ? 26 : 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ).animate().fadeIn().slideX(begin: -0.05, end: 0),
                  const SizedBox(height: 18),
                  const Text(
                    'UKR Solutions is an independent Flutter studio. I create cross-platform mobile apps '
                    'for Android and iOS — finance tools, construction calculators, health trackers, and more. '
                    'Every app is built to perform on mid-range devices and respect user privacy.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFCBD5E1),
                      height: 1.75,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _ChipLink(
                        label: 'About Me',
                        icon: Icons.person_outline_rounded,
                        onTap: () => context.go(Routes.about),
                      ),
                      _ChipLink(
                        label: 'Developer Blog',
                        icon: Icons.article_outlined,
                        onTap: () => context.go(Routes.blog),
                      ),
                      _ChipLink(
                        label: 'All Apps',
                        icon: Icons.apps_rounded,
                        onTap: () => context.go(Routes.apps),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChipLink extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ChipLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_ChipLink> createState() => _ChipLinkState();
}

class _ChipLinkState extends State<_ChipLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(999),
        child: AnimatedContainer(
          duration: 200.ms,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered
                ? AppTheme.accentIndigo.withValues(alpha: 0.25)
                : Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: _hovered
                  ? AppTheme.accentIndigo.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: AppTheme.accentIndigo),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
