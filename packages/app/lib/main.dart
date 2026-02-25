import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/screens/main_screen.dart';

void main() {
  runApp(const CRMApp());
}

class CRMApp extends StatelessWidget {
  const CRMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REwOrk CRM',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Defaulting to dark as per screenshot
      home: const MainScreen(),
    );
  }
}
