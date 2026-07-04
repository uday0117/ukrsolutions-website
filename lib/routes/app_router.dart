import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ukr_solutions_website/core/routes.dart';

import '../pages/about_page.dart';
import '../pages/apps_page.dart';
import '../pages/blog_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';
import '../pages/privacy_page.dart';
import '../pages/terms_page.dart';

Page<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      name: 'home',
      pageBuilder: (context, state) => _fadePage(state, const HomePage()),
    ),
    GoRoute(
      path: Routes.apps,
      name: 'apps',
      pageBuilder: (context, state) => _fadePage(state, const AppsPage()),
    ),
    GoRoute(
      path: Routes.about,
      name: 'about',
      pageBuilder: (context, state) => _fadePage(state, const AboutPage()),
    ),
    GoRoute(
      path: Routes.blog,
      name: 'blog',
      pageBuilder: (context, state) => _fadePage(state, const BlogPage()),
      routes: [
        GoRoute(
          path: ':slug',
          name: 'blog-article',
          pageBuilder: (context, state) {
            final slug = state.pathParameters['slug']!;
            return _fadePage(state, BlogArticlePage(slug: slug));
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.privacy,
      name: 'privacy',
      pageBuilder: (context, state) => _fadePage(state, const PrivacyPage()),
    ),
    GoRoute(
      path: Routes.terms,
      name: 'terms',
      pageBuilder: (context, state) => _fadePage(state, const TermsPage()),
    ),
    GoRoute(
      path: Routes.contact,
      name: 'contact',
      pageBuilder: (context, state) => _fadePage(state, const ContactPage()),
    ),
  ],
);
