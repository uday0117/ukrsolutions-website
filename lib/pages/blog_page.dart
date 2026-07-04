import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/responsive.dart';
import 'package:ukr_solutions_website/core/routes.dart';
import 'package:ukr_solutions_website/data/blog_data.dart';

import '../widgets/footer.dart';
import '../widgets/navbar.dart' as nav;

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const nav.NavigationBar(),
            _buildContent(context),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : (isTablet ? 60 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Developer Blog',
                style: TextStyle(
                  fontSize: isMobile ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Insights on Flutter development, Firebase, and publishing apps on Google Play',
                style: TextStyle(fontSize: 18, color: Color(0xFF94A3B8)),
              ),
              const SizedBox(height: 40),
              ...BlogData.articles.map((article) => _ArticleCard(article: article)),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogArticlePage extends StatelessWidget {
  final String slug;

  const BlogArticlePage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final article = BlogData.findBySlug(slug);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const nav.NavigationBar(),
            if (article == null)
              _NotFound()
            else
              _ArticleContent(article: article),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

class _ArticleCard extends StatefulWidget {
  final BlogArticle article;

  const _ArticleCard({required this.article});

  @override
  State<_ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<_ArticleCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () => context.go(Routes.blogArticle(widget.article.slug)),
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF3B82F6).withOpacity(0.5)
                  : Colors.white.withOpacity(0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.article.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.article.date} · ${widget.article.readTime}',
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 12),
              Text(
                widget.article.summary,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF94A3B8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Read article',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isHovered
                          ? const Color(0xFF3B82F6)
                          : const Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: isHovered
                        ? const Color(0xFF3B82F6)
                        : const Color(0xFF94A3B8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticleContent extends StatelessWidget {
  final BlogArticle article;

  const _ArticleContent({required this.article});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.go(Routes.blog),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, size: 18, color: Color(0xFF3B82F6)),
                    SizedBox(width: 6),
                    Text(
                      'Back to Blog',
                      style: TextStyle(color: Color(0xFF3B82F6), fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                article.title,
                style: TextStyle(
                  fontSize: isMobile ? 32 : 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${article.date} · ${article.readTime}',
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 32),
              ...article.paragraphs.map(
                (p) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    p,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFFCBD5E1),
                      height: 1.8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          const Text(
            'Article not found',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go(Routes.blog),
            child: const Text('Back to Blog'),
          ),
        ],
      ),
    );
  }
}
