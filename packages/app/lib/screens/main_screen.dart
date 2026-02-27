import 'package:flutter/material.dart';
import 'package:crm_dashboard/widgets/bottom_nav_bar.dart';
import 'package:crm_dashboard/screens/dashboard_screen.dart';
import 'package:crm_dashboard/screens/contacts_screen.dart';
import 'package:crm_dashboard/screens/company_screen.dart';
import 'package:crm_dashboard/screens/deals_pipeline_screen.dart';
import 'package:crm_dashboard/screens/tasks_screen.dart';
import 'package:crm_dashboard/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ContactsScreen(),
    const CompaniesScreen(),
    DealsPipelineScreen(),
    const TasksScreen(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
