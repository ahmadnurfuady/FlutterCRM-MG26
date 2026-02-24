import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF137FEC);
  static const Color backgroundLight = Color(0xFFF6F7F8);
  static const Color backgroundDark = Color(0xFF101922);
  static const Color surfaceDark = Color(0xFF1A2632);
  static const Color surfaceHighlight = Color(0xFF233040);

  // Colors from the design
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  static const Color emerald500 = Color(0xFF10B981);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color orange500 = Color(0xFFF97316);
  static const Color rose500 = Color(0xFFF43F5E);
  static const Color teal500 = Color(0xFF14B8A6);

  static const Color danger = Color(0xFFEC4848);
  static const Color warning = Color(0xFFECB213);


  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        surface: surfaceDark,
        onSurface: Colors.white,
        background: backgroundDark,
        onBackground: Colors.white,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: slate400,
      ),
      dividerColor: slate800,
      cardTheme: CardThemeData(
        color: surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
           side: const BorderSide(color: slate800, width: 1),
        ),
      )
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primary,
        surface: Colors.white,
        onSurface: slate900,
        background: backgroundLight,
        onBackground: slate900,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).apply(
        bodyColor: slate900,
        displayColor: slate900,
      ),
      iconTheme: const IconThemeData(
        color: slate500,
      ),
      dividerColor: slate200,
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
           side: const BorderSide(color: slate200, width: 1),
        ),
      )
    );
  }
}
