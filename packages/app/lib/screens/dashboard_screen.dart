import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crm_dashboard/widgets/dashboard/summary_grid.dart';
import 'package:crm_dashboard/widgets/dashboard/tasklist.dart';
import 'package:crm_dashboard/widgets/dashboard/deals.dart';
import 'package:crm_dashboard/widgets/dashboard/activity.dart';
import 'package:crm_dashboard/widgets/dashboard/leadsreport.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          // --- 1. HEADER DINAMIS (Pindahan dari HeaderSection lama) ---
          SliverAppBar(
            expandedHeight: 220.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFF1C2434),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded,
                    color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              titlePadding: const EdgeInsets.only(
                  left: 27, bottom: 16), // Biar mepet burger menu
              title: LayoutBuilder(
                builder: (context, constraints) {
                  var top = constraints.biggest.height;
                  // Teks muncul saat navbar mengecil (ketinggian < 100)
                  return top < 100
                      ? const Text(
                          "CRM-MG26 | Hai, Sayangku 👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox();
                },
              ),
              background: Container(
                padding: const EdgeInsets.fromLTRB(24, 80, 24, 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1C2434), Color(0xFF1C2434)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Pagi, Sayangku 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const Spacer(),
                    // Tombol Add New
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Add New Lead"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // --- 2. ISI KONTEN (Gantinya ListView) ---
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Summary(), // Summary Grid kamu
                const SizedBox(height: 32),
                const Deals(), // Deals section
                const SizedBox(height: 32),
                const LeadsReport(), //Leads section
                const SizedBox(height: 32),
                const TaskList(), // Task list section
                const SizedBox(height: 32),
                const Activity(), // activity section
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
