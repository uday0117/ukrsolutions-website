import 'package:flutter/material.dart';

class AppInfo {
  final String name;
  final String description;
  final IconData icon;
  final String? playStoreUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const AppInfo({
    required this.name,
    required this.description,
    required this.icon,
    this.playStoreUrl,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

class AppData {
  static const List<AppInfo> apps = [
    // Finance Apps - Gold Theme
    AppInfo(
      name: 'TrackGoldPro',
      description: 'TrackGold Pro - Your Premium Gold Price Tracking Companion',
      icon: Icons.attach_money,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.trackgoldpro',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
    ),

    AppInfo(
      name: 'LoanBee EMI Calculator',
      description: 'EMI Calculator App',
      icon: Icons.account_balance,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.loanbee',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
    ),

    // Productivity Apps - Blue Theme
    AppInfo(
      name: 'NexCalc',
      description: 'NexCalc - A Modern Calculator App',
      icon: Icons.calculate_outlined,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.nexcalc',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),

    AppInfo(
      name: 'BuildCalc',
      description: 'Construction Calculator',
      icon: Icons.construction,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.buildcalc',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),

    AppInfo(
      name: 'Memo Keeper',
      description: 'Notes & Reminders',
      icon: Icons.note_alt,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.memokeeper',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),

    // Learning App - Cyan Theme
    AppInfo(
      name: 'Learn Flutter & Dart',
      description: 'Flutter Learning App',
      icon: Icons.school,
      playStoreUrl: '',
      primaryColor: Color(0xFF06B6D4),
      secondaryColor: Color(0xFF0891B2),
    ),

    // Health App - Pink Theme
    AppInfo(
      name: 'FemGlow',
      description: 'FemGlow — Period & Cycle Tracker',
      icon: Icons.favorite,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.femglow',
      primaryColor: Color(0xFFEC4899),
      secondaryColor: Color(0xFFDB2777),
    ),
  ];
}
