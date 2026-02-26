import 'package:flutter/material.dart';
import 'package:crm_dashboard/widgets/dashboard/header_section.dart';
import 'package:crm_dashboard/widgets/dashboard/summary_grid.dart';
import 'package:crm_dashboard/widgets/dashboard/tasklist.dart';
import 'package:crm_dashboard/widgets/dashboard/deals.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HeaderSection(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                children: const [
                  Summary(),
                  SizedBox(height: 32),
                  Deals(),
                  SizedBox(height: 32),
                  TaskList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
