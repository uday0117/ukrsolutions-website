import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/core/routes.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: isMobile ? 520 : 620),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 40,
            left: MediaQuery.sizeOf(context).width * 0.15,
            child: AnimatedBuilder(
              animation: _floatController,
              builder: (_, child) => Transform.translate(
                offset: Offset(0, _floatController.value * 16 - 8),
                child: child,
              ),
              child: _GlowDot(
                size: 180,
                color: AppTheme.accentIndigo.withValues(alpha: 0.25),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: MediaQuery.sizeOf(context).width * 0.1,
            child: AnimatedBuilder(
              animation: _floatController,
              builder: (_, child) => Transform.translate(
                offset: Offset(0, 8 - _floatController.value * 16),
                child: child,
              ),
              child: _GlowDot(
                size: 140,
                color: AppTheme.accentCyan.withValues(alpha: 0.2),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
                vertical: isMobile ? 72 : 96,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isMobile ? 88 : 104,
                    height: isMobile ? 88 : 104,
                    decoration: BoxDecoration(
                      gradient: AppTheme.heroGradient,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.accentBlue.withValues(alpha: 0.4),
                          blurRadius: 48,
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'U',
                        style: TextStyle(
                          fontSize: isMobile ? 48 : 56,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .scale(
                        begin: const Offset(0.8, 0.8),
                        curve: Curves.easeOutBack,
                      ),
                  SizedBox(height: isMobile ? 36 : 48),
                  ShaderMask(
                    shaderCallback: (b) => AppTheme.heroGradient.createShader(b),
                    child: Text(
                      'Hi, I\'m Uday Reddy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 36 : (isTablet ? 52 : 64),
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: -1,
                      ),
                    ),
                  ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.2, end: 0),
                  SizedBox(height: isMobile ? 14 : 18),
                  Text(
                    'Flutter Developer & App Publisher',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 24,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentCyan,
                      letterSpacing: 0.2,
                    ),
                  ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15, end: 0),
                  SizedBox(height: isMobile ? 20 : 28),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      'I build beautiful, high-performance Android & iOS apps with Flutter — from finance tools to health trackers, published on Google Play.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        color: AppTheme.textMuted,
                        height: 1.7,
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  SizedBox(height: isMobile ? 36 : 48),
                  Wrap(
                    spacing: 16,
                    runSpacing: 14,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go(Routes.apps),
                        icon: const Icon(Icons.apps_rounded, size: 20),
                        label: const Text('Explore Apps'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentBlue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 32,
                            vertical: 18,
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => context.go(Routes.contact),
                        icon: const Icon(Icons.mail_outline_rounded, size: 20),
                        label: const Text('Hire Me'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24 : 32,
                            vertical: 18,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 550.ms).slideY(begin: 0.1, end: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowDot extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowDot({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, Colors.transparent]),
      ),
    );
  }
}
