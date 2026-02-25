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

  static const Color fecbuk = Color(0xFF3B5998); // fecbuk
  static const Color white = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFD34053);
  static const Color darkRed = Color(0xFF330405);
  static const Color green = Color(0xFF219653);
  static const Color goodGreen = Color(0xFF10B981);
  static const Color yellow = Color(0xFFFFA70B);
  static const Color orange = Color(0xFFB93510);

  static const Color darkBase = Color(0xFF1C2434);
  static const Color lightBase = Color(0xFFEFF1F6);
  static const Color darkHover = Color(0xFF333848);

  static const Color subText = Color(0xFF64728B);
  static const Color outline = Color(0xFFD6DAE5);
  static const Color evenRow = Color(0xFFF9F9FD);
  static const Color coolGreyBg = Color(0xFFE5E7EB);

  static const Color deferredColor = Color(0xFF2E334A);
  static const Color progressColor = Color(0xFF525E75);
  static const Color waitingColor = Color(0xFF404460);
  static const Color pipeline = Color(0xFFF4F5FB);
  static const Color points = Color(0xFF64788B);

  /*
  ==========================================
  🌙 DARK THEME
  ==========================================
  */

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBase,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        surface: darkBase,
        onSurface: Colors.white,
        background: darkBase,
        onBackground: Colors.white,
      ),
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      iconTheme: const IconThemeData(color: subText),
      dividerColor: darkHover,
      cardTheme: CardThemeData(
        color: darkHover,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: darkHover),
        ),
      ),
    );
  }

  /*
  ==========================================
  ☀️ LIGHT THEME
  ==========================================
  */

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBase,
      colorScheme: const ColorScheme.light(
        primary: primary,
        surface: white,
        onSurface: darkBase,
        background: lightBase,
        onBackground: darkBase,
      ),
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.light().textTheme,
      ).apply(bodyColor: darkBase, displayColor: darkBase),
      iconTheme: const IconThemeData(color: subText),
      dividerColor: outline,
      cardTheme: CardThemeData(
        color: white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: outline),
        ),
      ),
    );
  }
}
