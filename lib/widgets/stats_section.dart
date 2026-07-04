import 'package:flutter/material.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';
import 'package:ukr_solutions_website/widgets/animated_reveal.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return AnimatedReveal(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: isMobile ? 32 : 48,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: const [
            _StatCard(number: '7+', label: 'Published Apps', icon: Icons.apps),
            _StatCard(
              number: '5+',
              label: 'Years Experience',
              icon: Icons.code,
            ),
            _StatCard(
              number: '50K+',
              label: 'Downloads',
              icon: Icons.download_rounded,
            ),
            _StatCard(
              number: '100+',
              label: 'Features Shipped',
              icon: Icons.bolt_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 200,
        padding: const EdgeInsets.all(24),
        transform: _hovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: _hovered ? 0.09 : 0.05),
              Colors.white.withValues(alpha: 0.02),
            ],
          ),
          border: Border.all(
            color: _hovered
                ? AppTheme.accentIndigo.withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              color: AppTheme.accentIndigo,
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              widget.number,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
