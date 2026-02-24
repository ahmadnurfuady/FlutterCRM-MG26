import 'package:flutter/material.dart';
import 'package:crm_dashboard/widgets/header_section.dart';
import 'package:crm_dashboard/widgets/kpi_grid.dart';
import 'package:crm_dashboard/widgets/upcoming_tasks.dart';
import 'package:crm_dashboard/widgets/revenue_chart.dart';

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
                  KPIGrid(),
                  SizedBox(height: 32),
                  RevenueChart(),
                  SizedBox(height: 32),
                  UpcomingTasks(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
