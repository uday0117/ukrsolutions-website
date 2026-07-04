import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';

/// Ambient gradient orbs behind page content.
class MeshBackground extends StatelessWidget {
  final Widget child;

  const MeshBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -120,
          right: -80,
          child: _Orb(
            size: 420,
            colors: [
              AppTheme.accentIndigo.withValues(alpha: 0.22),
              Colors.transparent,
            ],
          ),
        ),
        Positioned(
          top: 400,
          left: -100,
          child: _Orb(
            size: 360,
            colors: [
              AppTheme.accentPurple.withValues(alpha: 0.16),
              Colors.transparent,
            ],
          ),
        ),
        Positioned(
          bottom: 200,
          right: -60,
          child: _Orb(
            size: 300,
            colors: [
              AppTheme.accentCyan.withValues(alpha: 0.14),
              Colors.transparent,
            ],
          ),
        ),
        child,
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const _Orb({required this.size, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: colors),
      ),
    );
  }
}
