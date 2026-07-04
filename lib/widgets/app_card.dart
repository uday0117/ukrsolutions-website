import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ukr_solutions_website/core/url_utils.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';

class AppCardWidget extends StatefulWidget {
  final String appName;
  final String description;
  final String? longDescription;
  final List<String>? features;
  final IconData icon;
  final String? playStoreUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const AppCardWidget({
    super.key,
    required this.appName,
    required this.description,
    this.longDescription,
    this.features,
    required this.icon,
    this.playStoreUrl,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<AppCardWidget> createState() => _AppCardWidgetState();
}

class _AppCardWidgetState extends State<AppCardWidget> {
  bool _hovered = false;

  bool get _hasStore => hasPlayStoreUrl(widget.playStoreUrl);

  Future<void> _openStore() async {
    if (!_hasStore) return;
    await openExternalUrl(widget.playStoreUrl!);
  }

  @override
  Widget build(BuildContext context) {
    final bodyText = widget.longDescription ?? widget.description;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _hasStore ? _openStore : null,
        child: AnimatedContainer(
          duration: 350.ms,
          curve: Curves.easeOutCubic,
          transform: _hovered
              ? Matrix4.translationValues(0, -10, 0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.07),
                Colors.white.withValues(alpha: 0.02),
              ],
            ),
            border: Border.all(
              color: _hovered
                  ? widget.primaryColor.withValues(alpha: 0.45)
                  : Colors.white.withValues(alpha: 0.1),
            ),
            boxShadow: [
              if (_hovered)
                BoxShadow(
                  color: widget.primaryColor.withValues(alpha: 0.15),
                  blurRadius: 32,
                  spreadRadius: -4,
                ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Gradient accent strip
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 3,
                  child: AnimatedContainer(
                    duration: 350.ms,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [widget.primaryColor, widget.secondaryColor],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  widget.primaryColor,
                                  widget.secondaryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: widget.primaryColor.withValues(
                                    alpha: 0.35,
                                  ),
                                  blurRadius: 20,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Icon(
                              widget.icon,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          if (_hasStore)
                            Icon(
                              Icons.open_in_new_rounded,
                              size: 18,
                              color: _hovered
                                  ? widget.primaryColor
                                  : AppTheme.textMuted,
                            ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Text(
                        widget.appName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bodyText,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppTheme.textMuted,
                          height: 1.6,
                        ),
                      ),
                      if (widget.features != null &&
                          widget.features!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        ...widget.features!.take(3).map(
                          (f) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  size: 16,
                                  color: widget.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    f,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFCBD5E1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 22),
                      if (_hasStore)
                        _StoreButton(
                          color: widget.primaryColor,
                          hovered: _hovered,
                          onPressed: _openStore,
                        )
                      else
                        const _ComingSoonBadge(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final Color color;
  final bool hovered;
  final VoidCallback onPressed;

  const _StoreButton({
    required this.color,
    required this.hovered,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.shop_rounded, size: 18),
        label: const Text('Get on Play Store'),
        style: ElevatedButton.styleFrom(
          backgroundColor: hovered ? color : color.withValues(alpha: 0.85),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _ComingSoonBadge extends StatelessWidget {
  const _ComingSoonBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.schedule_rounded, size: 18, color: AppTheme.textMuted),
          SizedBox(width: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
