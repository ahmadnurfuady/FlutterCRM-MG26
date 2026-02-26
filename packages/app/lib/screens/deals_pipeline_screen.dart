import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/kanban_column.dart';
import 'package:crm_dashboard/widgets/kanban_card.dart';

class DealsPipelineScreen extends StatelessWidget {
  const DealsPipelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check for dark mode to match specific design tweaks if needed
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deals Pipeline',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'REwOrk CRM',
              style: TextStyle(
                fontSize: 12,
                color: isDark ? AppTheme.slate400 : AppTheme.slate500,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              elevation: 2,
              child: const Icon(Icons.add),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: isDark ? const Color(0xFF1F2937) : const Color(0xFFE5E7EB),
            height: 1.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: [
          // Column 1: Lead Masuk
          KanbanColumn(
            title: 'Lead Masuk',
            count: 3,
            potential: 'Rp 120jt',
            color: Colors.blue.shade400,
            cards: const [
              KanbanCard(
                title: 'ERP Implementation',
                amount: 'Rp 100jt',
                ownerName: 'Budi Santoso',
                ownerInitials: 'BS',
                ownerColor: Colors.indigo,
                probability: 0.1,
                progressColor: Colors.blue,
              ),
              KanbanCard(
                title: 'Consulting Q3',
                amount: 'Rp 20jt',
                ownerName: 'Sarah Wijaya',
                ownerImage:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAAv76JmCxnFg6OSio-ObwzmzMw3mOxw9oYz384k5edIwVXjk4V9Hxxa_pbjRjIuyAdXVeNxre5zUy_HLC2DrGRYWiaSVD21T1BFOqdchHhGkVCEHoY8E9KWLkO_RU1X0tB9e5TJ5R-mAPe-zJ7gjtNQEmcmbqRUE3BuKkfTmTS9sGqQg7-DKl45bHWqIVQt9kayv0zxuEtORIZ5Ri1RM5pIQNiK9Rr3UUXSRWZD1yaawS7UafAZcjcoLg7xnrcyeHd-guWSbNUsfk',
                probability: 0.15,
                progressColor: Colors.blue,
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Column 2: Kualifikasi
          KanbanColumn(
            title: 'Kualifikasi',
            count: 5,
            potential: 'Rp 450jt',
            color: Colors.yellow.shade400,
            cards: const [
              KanbanCard(
                title: 'Web Redesign',
                amount: 'Rp 75jt',
                ownerName: 'Andi',
                ownerInitials: 'A',
                ownerColor: AppTheme.primary,
                probability: 0.6,
                progressColor: Colors.yellow,
              ),
              KanbanCard(
                title: 'Mobile App MVP',
                amount: 'Rp 150jt',
                ownerName: 'Siti Aminah',
                ownerImage:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzYmGoccoGKMjtyDbxE0MVAq04SSLpkrdIxYNEaRVuHYwU3o8hPQhTNa85O0x5LVc2s5-Vytw4wsUToplpWMelbujcIIEXCSvIJDeej9qQ_e5dFkZJnvfBGGRcFxZog6jSIsWO-szTw__MLoSCEAVZfIoQxFCjv3ArC-mJx0-edbMGxKBNuDDrDzI0jeol63gT-Ry_1K2PiCj0pbf_R1lTFziZOgkds3Ygttr5aeoW0dHKQMB4Teq39iIGBm3eqKMCoJuJKHn2gJc',
                probability: 0.4,
                progressColor: Colors.yellow,
              ),
              KanbanCard(
                title: 'CRM Integration',
                amount: 'Rp 225jt',
                ownerName: 'Tari Ramadhani',
                ownerInitials: 'TR',
                ownerColor: Colors.pink,
                probability: 0.55,
                progressColor: Colors.yellow,
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Column 3: Negosiasi
          KanbanColumn(
            title: 'Negosiasi',
            count: 2,
            potential: 'Rp 800jt',
            color: Colors.green.shade400,
            cards: const [
              KanbanCard(
                title: 'Cloud Migration',
                amount: 'Rp 500jt',
                ownerName: 'John Doe',
                ownerImage:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBYhD2qSeFDwRQ5G5lT3D2NLvXglvygLLqWiC1GVnyCDeq-NIGtCUtMhvzww9RPy-tcvgp_kSXAv49lIKy1O2GTR3e2YDqxZlTHgB8nEb9QkDtPYn9Yog4ifJoC2A-nEKOHQCqVumiOQqjVOvkVj3p3qiEeRYYh0floFNbdGVKSB6utGlJelL66YKZuxZ9VXk10L7Vp68MjWlB02aFljqmLBIQZZnrumsuewy_uaBDfdU1ZMBxZPU6F9i8MfDdszLqoPK6wd201anM',
                probability: 0.9,
                progressColor: Colors.green,
              ),
              KanbanCard(
                title: 'Maintenance Contract',
                amount: 'Rp 300jt',
                ownerName: 'PT Maju Jaya',
                ownerInitials: 'PT',
                ownerColor: Colors.orange,
                probability: 0.85,
                progressColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
