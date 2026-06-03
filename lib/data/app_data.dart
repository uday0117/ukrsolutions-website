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
    AppInfo(
      name: 'DocFlow',
      description: 'PDF Tools & Editor',
      icon: Icons.picture_as_pdf,
      playStoreUrl: '',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),

    AppInfo(
      name: 'DocSnap',
      description: 'Document Scanner',
      icon: Icons.document_scanner,
      playStoreUrl: '',
      primaryColor: Color(0xFF10B981),
      secondaryColor: Color(0xFF059669),
    ),

    AppInfo(
      name: 'BuildCalc',
      description: 'Construction Calculator',
      icon: Icons.calculate,
      playStoreUrl: '',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
    ),

    AppInfo(
      name: 'FemGlow',
      description: 'Women Health Tracker',
      icon: Icons.favorite,
      playStoreUrl: '',
      primaryColor: Color(0xFFEC4899),
      secondaryColor: Color(0xFFDB2777),
    ),

    AppInfo(
      name: 'Memo Keeper',
      description: 'Notes & Reminders',
      icon: Icons.note_alt,
      playStoreUrl: '',
      primaryColor: Color(0xFF8B5CF6),
      secondaryColor: Color(0xFF7C3AED),
    ),

    AppInfo(
      name: 'Learn Flutter & Dart',
      description: 'Flutter Learning App',
      icon: Icons.school,
      playStoreUrl: '',
      primaryColor: Color(0xFF06B6D4),
      secondaryColor: Color(0xFF0891B2),
    ),
  ];
}
