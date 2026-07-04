import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Fades and slides content in when it enters the viewport.
class AnimatedReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset slideBegin;

  const AnimatedReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideBegin = const Offset(0, 0.08),
  });

  @override
  State<AnimatedReveal> createState() => _AnimatedRevealState();
}

class _AnimatedRevealState extends State<AnimatedReveal> {
  final _key = GlobalKey();
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  void _checkVisibility() {
    final context = _key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;

    final position = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.sizeOf(this.context).height;

    if (position.dy < screenHeight * 0.92) {
      if (mounted) setState(() => _visible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        if (!_visible) _checkVisibility();
        return false;
      },
      child: KeyedSubtree(
        key: _key,
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: 600.ms,
          curve: Curves.easeOutCubic,
          child: AnimatedSlide(
            offset: _visible ? Offset.zero : widget.slideBegin,
            duration: 700.ms,
            curve: Curves.easeOutCubic,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

/// Staggered fade-in for list/grid children.
extension StaggerAnimate on Widget {
  Widget staggerIn({required int index, Duration baseDelay = const Duration(milliseconds: 100)}) {
    return animate()
        .fadeIn(duration: 500.ms, delay: baseDelay * index, curve: Curves.easeOut)
        .slideY(
          begin: 0.12,
          end: 0,
          duration: 550.ms,
          delay: baseDelay * index,
          curve: Curves.easeOutCubic,
        );
  }
}
