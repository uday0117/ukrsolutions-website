import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const bgDark = Color(0xFF020617);
  static const surface = Color(0xFF0F172A);
  static const card = Color(0xFF1E293B);
  static const accentBlue = Color(0xFF3B82F6);
  static const accentIndigo = Color(0xFF6366F1);
  static const accentCyan = Color(0xFF06B6D4);
  static const accentPurple = Color(0xFF8B5CF6);
  static const textMuted = Color(0xFF94A3B8);

  static ThemeData get darkTheme {
    final baseText = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: accentIndigo,
        primaryContainer: const Color(0xFF4F46E5),
        secondary: accentPurple,
        tertiary: accentCyan,
        surface: surface,
        surfaceContainerHighest: card,
        error: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFFF1F5F9),
      ),
      scaffoldBackgroundColor: bgDark,
      textTheme: baseText.apply(
        bodyColor: const Color(0xFFCBD5E1),
        displayColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: card,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          side: BorderSide(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: accentIndigo, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }

  static BoxDecoration glassCard({Color? glowColor}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.07),
          Colors.white.withValues(alpha: 0.02),
        ],
      ),
      border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      boxShadow: [
        if (glowColor != null)
          BoxShadow(
            color: glowColor.withValues(alpha: 0.12),
            blurRadius: 32,
            spreadRadius: -4,
          ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  static const heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentBlue, Color(0xFF10B981), accentPurple],
  );
}
