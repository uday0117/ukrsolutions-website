import 'package:flutter/material.dart';

class AppInfo {
  final String name;
  final String description;
  final String longDescription;
  final List<String> features;
  final IconData icon;
  final String? playStoreUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const AppInfo({
    required this.name,
    required this.description,
    required this.longDescription,
    required this.features,
    required this.icon,
    this.playStoreUrl,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

class AppData {
  static const List<AppInfo> apps = [
    AppInfo(
      name: 'TrackGoldPro',
      description: 'Real-time gold price tracking with alerts and portfolio tools',
      longDescription:
          'TrackGoldPro helps investors and jewellers monitor gold prices across major markets. '
          'Set custom price alerts, track your holdings, and view historical trends — all in a clean, '
          'fast interface designed for daily use.',
      features: [
        'Live gold price updates',
        'Custom price alerts and notifications',
        'Portfolio tracking with profit/loss',
        'Historical price charts',
        'Works offline with cached data',
      ],
      icon: Icons.attach_money,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.trackgoldpro',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
    ),
    AppInfo(
      name: 'LoanBee EMI Calculator',
      description: 'Smart loan planning with EMI breakdowns and amortization schedules',
      longDescription:
          'LoanBee makes loan planning straightforward. Calculate EMIs for home, car, and personal loans, '
          'compare interest rates, and view full amortization schedules before you commit to a lender.',
      features: [
        'EMI calculator for any loan type',
        'Amortization schedule with principal/interest split',
        'Compare multiple loan scenarios side by side',
        'Export and share calculation results',
        'Simple, ad-light interface',
      ],
      icon: Icons.account_balance,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.loanbee',
      primaryColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
    ),
    AppInfo(
      name: 'NexCalc',
      description: 'Modern scientific calculator with history and unit conversions',
      longDescription:
          'NexCalc is a feature-rich calculator for students, engineers, and professionals. '
          'It supports scientific functions, calculation history, and built-in unit conversions '
          'in a Material Design 3 interface.',
      features: [
        'Scientific and standard modes',
        'Calculation history with reuse',
        'Unit and currency conversions',
        'Dark theme optimized for long sessions',
        'Haptic feedback on key presses',
      ],
      icon: Icons.calculate_outlined,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.nexcalc',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),
    AppInfo(
      name: 'BuildCalc',
      description: 'Construction material and cost calculator for builders and homeowners',
      longDescription:
          'BuildCalc simplifies construction estimation. Calculate cement, sand, steel, and brick quantities '
          'for common structures. Ideal for contractors quoting jobs and homeowners planning renovations.',
      features: [
        'Material quantity calculators for walls, slabs, and columns',
        'Cost estimation with customizable rates',
        'Save and revisit past projects',
        'Metric and imperial unit support',
        'Built for field use on construction sites',
      ],
      icon: Icons.construction,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.buildcalc',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),
    AppInfo(
      name: 'Memo Keeper',
      description: 'Notes and reminders with local storage and optional cloud sync',
      longDescription:
          'Memo Keeper is a lightweight notes app for quick capture and reliable reminders. '
          'Write notes, set time-based alerts, and organize with tags — your data stays on your device '
          'with optional Firebase backup.',
      features: [
        'Quick note capture with rich text',
        'Scheduled reminders and notifications',
        'Tag-based organization and search',
        'Offline-first with cloud backup option',
        'Minimal, distraction-free design',
      ],
      icon: Icons.note_alt,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.memokeeper',
      primaryColor: Color(0xFF3B82F6),
      secondaryColor: Color(0xFF2563EB),
    ),
    AppInfo(
      name: 'Learn Flutter & Dart',
      description: 'Interactive tutorials for learning Flutter and Dart from scratch',
      longDescription:
          'A structured learning app covering Flutter widgets, state management, navigation, and Firebase integration. '
          'Designed for beginners who want hands-on lessons they can run on their own device.',
      features: [
        'Step-by-step Flutter tutorials',
        'Runnable code examples',
        'Dart language fundamentals',
        'Widget catalog with live previews',
        'Progress tracking across lessons',
      ],
      icon: Icons.school,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.learnflutter',
      primaryColor: Color(0xFF06B6D4),
      secondaryColor: Color(0xFF0891B2),
    ),
    AppInfo(
      name: 'FemGlow',
      description: 'Period and cycle tracker with health insights and smart reminders',
      longDescription:
          'FemGlow helps users track menstrual cycles, predict periods, and log symptoms. '
          'Privacy-focused with local data storage, optional cloud sync, and personalized health insights '
          'based on logged patterns.',
      features: [
        'Cycle and period prediction',
        'Symptom and mood logging',
        'Ovulation and fertility window estimates',
        'Discreet reminders and privacy lock',
        'Export data for doctor visits',
      ],
      icon: Icons.favorite,
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.uksolutions.femglow',
      primaryColor: Color(0xFFEC4899),
      secondaryColor: Color(0xFFDB2777),
    ),
  ];
}
