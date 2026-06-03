import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => context.go('/'),
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
                    if (!isMobile) ...[
                      const SizedBox(width: 12),
                      const Text(
                        'UKR Solutions',
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

              // Navigation items
              if (isMobile)
                _MobileMenu(currentPath: currentPath)
              else
                _DesktopMenu(currentPath: currentPath),
            ],
          );
        },
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
        _NavItem(title: 'Home', path: '/', currentPath: currentPath),
        const SizedBox(width: 32),
        _NavItem(title: 'Apps', path: '/apps', currentPath: currentPath),
        const SizedBox(width: 32),
        _NavItem(
          title: 'Privacy Policy',
          path: '/privacy',
          currentPath: currentPath,
        ),
        const SizedBox(width: 32),
        _NavItem(title: 'Contact', path: '/contact', currentPath: currentPath),
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
      children: [
        IconButton(
          icon: Icon(isOpen ? Icons.close : Icons.menu),
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
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
                    path: '/',
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Apps',
                    path: '/apps',
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Privacy Policy',
                    path: '/privacy',
                    currentPath: widget.currentPath,
                    onTap: () => setState(() => isOpen = false),
                  ),
                  _NavItem(
                    title: 'Contact',
                    path: '/contact',
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

  @override
  Widget build(BuildContext context) {
    final isActive = widget.currentPath == widget.path;

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
