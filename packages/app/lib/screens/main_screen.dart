import 'package:flutter/material.dart';
import 'package:crm_dashboard/widgets/bottom_nav_bar.dart';
import 'package:crm_dashboard/screens/dashboard_screen.dart';
import 'package:crm_dashboard/screens/contacts_screen.dart';
import 'package:crm_dashboard/screens/deals_pipeline_screen.dart';
import 'package:crm_dashboard/screens/tasks_screen.dart';
import 'package:crm_dashboard/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4; // Default to Settings for this task

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ContactsScreen(),
    const DealsPipelineScreen(),
    const TasksScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
