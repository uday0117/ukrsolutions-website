import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/data/site_data.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = Responsive.isMobile(context);
          final isTablet = Responsive.isTablet(context);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 48,
            ),
            child: isMobile ? _MobileFooter() : _DesktopFooter(),
          );
        },
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Company info
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'U',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        SiteData.companyName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    SiteData.role,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF94A3B8),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(
                        Icons.email_outlined,
                        size: 16,
                        color: Color(0xFF94A3B8),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          SiteData.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF94A3B8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.language, size: 16, color: Color(0xFF94A3B8)),
                      SizedBox(width: 8),
                      Text(
                        SiteData.website,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Quick Links
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Links',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _FooterLink(title: 'Home', path: '/'),
                  _FooterLink(title: 'Apps', path: '/apps'),
                  _FooterLink(title: 'Privacy Policy', path: '/privacy'),
                  _FooterLink(title: 'Terms & Conditions', path: '/terms'),
                  _FooterLink(title: 'Contact', path: '/contact'),
                ],
              ),
            ),

            // Apps
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Featured Apps',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _FooterText('DocFlow'),
                  _FooterText('DocSnap'),
                  _FooterText('FemGlow'),
                  _FooterText('BuildCalc'),
                  _FooterText('Memo Keeper'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Container(height: 1, color: Colors.white.withOpacity(0.1)),
        const SizedBox(height: 24),
        Text(
          '© ${DateTime.now().year} ${SiteData.companyName}. All rights reserved.',
          style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),
      ],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Company info
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.circular(8),
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
            const SizedBox(width: 12),
            Text(
              SiteData.companyName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          SiteData.role,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),

        // Contact
        const Row(
          children: [
            Icon(Icons.email_outlined, size: 16, color: Color(0xFF94A3B8)),
            SizedBox(width: 8),
            Text(
              SiteData.email,
              style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.language, size: 16, color: Color(0xFF94A3B8)),
            SizedBox(width: 8),
            Text(
              SiteData.website,
              style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
        const SizedBox(height: 24),

        Container(height: 1, color: Colors.white.withOpacity(0.1)),
        const SizedBox(height: 24),

        Text(
          '© ${DateTime.now().year} ${SiteData.companyName}. All rights reserved.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String title;
  final String path;

  const _FooterLink({required this.title, required this.path});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () => context.go(widget.path),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              color: isHovered
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF94A3B8),
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  final String text;

  const _FooterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
      ),
    );
  }
}
