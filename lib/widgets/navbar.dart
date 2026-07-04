import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/core/routes.dart';
import 'package:ukr_solutions_website/data/site_data.dart';
import 'package:ukr_solutions_website/theme/app_theme.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: AppTheme.surface.withValues(alpha: 0.75),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = Responsive.isDesktop(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => context.go(Routes.home),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF3B82F6).withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'U',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (isDesktop) ...[
                      const SizedBox(width: 12),
                      const Text(
                        SiteData.companyName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isDesktop)
                _DesktopMenu(currentPath: currentPath)
              else
                _MobileMenu(currentPath: currentPath),
            ],
          );
        },
      ),
        ),
      ),
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  final String currentPath;

  const _DesktopMenu({required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavItem(title: 'Home', path: Routes.home, currentPath: currentPath),
        const SizedBox(width: 28),
        _NavItem(title: 'Apps', path: Routes.apps, currentPath: currentPath),
        const SizedBox(width: 28),
        _NavItem(title: 'About', path: Routes.about, currentPath: currentPath),
        const SizedBox(width: 28),
        _NavItem(title: 'Blog', path: Routes.blog, currentPath: currentPath),
        const SizedBox(width: 28),
        _NavItem(title: 'Contact', path: Routes.contact, currentPath: currentPath),
      ],
    );
  }
}

class _MobileMenu extends StatefulWidget {
  final String currentPath;

  const _MobileMenu({required this.currentPath});

  @override
  State<_MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<_MobileMenu> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(isOpen ? Icons.close : Icons.menu),
          onPressed: () => setState(() => isOpen = !isOpen),
        ),
        if (isOpen)
          Positioned(
            top: 50,
            right: 0,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  _NavItem(
                    title: 'Home',
                    path: Routes.home,
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Apps',
                    path: Routes.apps,
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'About',
                    path: Routes.about,
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Blog',
                    path: Routes.blog,
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Contact',
                    path: Routes.contact,
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final String path;
  final String currentPath;
  final VoidCallback? onTap;

  const _NavItem({
    required this.title,
    required this.path,
    required this.currentPath,
    this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  bool get isActive {
    if (widget.path == Routes.home) {
      return widget.currentPath == Routes.home;
    }
    return widget.currentPath.startsWith(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () {
          context.go(widget.path);
          widget.onTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive
                    ? const Color(0xFF3B82F6)
                    : isHovered
                    ? const Color(0xFF3B82F6).withOpacity(0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: isActive || isHovered
                  ? Colors.white
                  : const Color(0xFF94A3B8),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
