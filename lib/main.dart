import 'package:flutter/material.dart';

import 'core/ads_config.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const UKRSolutionsApp());
}

class UKRSolutionsApp extends StatefulWidget {
  const UKRSolutionsApp({super.key});

  @override
  State<UKRSolutionsApp> createState() => _UKRSolutionsAppState();
}

class _UKRSolutionsAppState extends State<UKRSolutionsApp> {
  @override
  void initState() {
    super.initState();
    router.routerDelegate.addListener(_onRouteChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onRouteChanged();
    });
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onRouteChanged() {
    final path = router.routerDelegate.currentConfiguration.uri.path;
    updateAdsForPath(path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Uday Reddy | Flutter Developer & Mobile App Builder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
