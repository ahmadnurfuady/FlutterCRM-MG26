import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/deals/kanban_column.dart';
import 'package:crm_dashboard/widgets/deals/kanban_card.dart';
import 'package:crm_dashboard/widgets/deals/list_deals.dart'; // tambahkan ini
import 'package:crm_dashboard/widgets/deals/deal_helpers.dart'; // tambahkan ini

// Enum untuk status deal
enum DealStage {
  newDeal,
  qualified,
  advanced,
  payment,
  won,
  lose,
}

// Model Deal sederhana
class Deal {
  final String title;
  final String amount;
  final String ownerName;
  final String? ownerInitials;
  final String? ownerImage;
  final Color? ownerColor;
  final double probability;
  final DealStage stage;

  Deal({
    required this.title,
    required this.amount,
    required this.ownerName,
    this.ownerInitials,
    this.ownerImage,
    this.ownerColor,
    required this.probability,
    required this.stage,
  });
}

class DealsPipelineScreen extends StatefulWidget {
  const DealsPipelineScreen({super.key});

  @override
  State<DealsPipelineScreen> createState() => _DealsPipelineScreenState();
}

class _DealsPipelineScreenState extends State<DealsPipelineScreen> {
  bool _isListView = false;

  // Contoh data deals
  final List<Deal> allDeals = [
    // Lead Masuk (new)
    Deal(
      title: 'ERP Implementation',
      amount: 'Rp 100jt',
      ownerName: 'Budi Santoso',
      ownerInitials: 'BS',
      ownerColor: Colors.indigo,
      probability: 0.1,
      stage: DealStage.newDeal,
    ),
    Deal(
      title: 'Consulting Q3',
      amount: 'Rp 20jt',
      ownerName: 'Sarah Wijaya',
      ownerImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAAv76JmCxnFg6OSio-ObwzmzMw3mOxw9oYz384k5edIwVXjk4V9Hxxa_pbjRjIuyAdXVeNxre5zUy_HLC2DrGRYWiaSVD21T1BFOqdchHhGkVCEHoY8E9KWLkO_RU1X0tB9e5TJ5R-mAPe-zJ7gjtNQEmcmbqRUE3BuKkfTmTS9sGqQg7-DKl45bHWqIVQt9kayv0zxuEtORIZ5Ri1RM5pIQNiK9Rr3UUXSRWZD1yaawS7UafAZcjcoLg7xnrcyeHd-guWSbNUsfk',
      probability: 0.15,
      stage: DealStage.newDeal,
    ),
    // Kualifikasi (qualified)
    Deal(
      title: 'Web Redesign',
      amount: 'Rp 75jt',
      ownerName: 'Andi',
      ownerInitials: 'A',
      ownerColor: AppTheme.primary,
      probability: 0.6,
      stage: DealStage.qualified,
    ),
    Deal(
      title: 'Mobile App MVP',
      amount: 'Rp 150jt',
      ownerName: 'Siti Aminah',
      ownerImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAzYmGoccoGKMjtyDbxE0MVAq04SSLpkrdIxYNEaRVuHYwU3o8hPQhTNa85O0x5LVc2s5-Vytw4wsUToplpWMelbujcIIEXCSvIJDeej9qQ_e5dFkZJnvfBGGRcFxZog6jSIsWO-szTw__MLoSCEAVZfIoQxFCjv3ArC-mJx0-edbMGxKBNuDDrDzI0jeol63gT-Ry_1K2PiCj0pbf_R1lTFziZOgkds3Ygttr5aeoW0dHKQMB4Teq39iIGBm3eqKMCoJuJKHn2gJc',
      probability: 0.4,
      stage: DealStage.qualified,
    ),
    Deal(
      title: 'CRM Integration',
      amount: 'Rp 225jt',
      ownerName: 'Tari Ramadhani',
      ownerInitials: 'TR',
      ownerColor: Colors.pink,
      probability: 0.55,
      stage: DealStage.qualified,
    ),
    // Negosiasi (advanced)
    Deal(
      title: 'Cloud Migration',
      amount: 'Rp 500jt',
      ownerName: 'John Doe',
      ownerImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBYhD2qSeFDwRQ5G5lT3D2NLvXglvygLLqWiC1GVnyCDeq-NIGtCUtMhvzww9RPy-tcvgp_kSXAv49lIKy1O2GTR3e2YDqxZlTHgB8nEb9QkDtPYn9Yog4ifJoC2A-nEKOHQCqVumiOQqjVOvkVj3p3qiEeRYYh0floFNbdGVKSB6utGlJelL66YKZuxZ9VXk10L7Vp68MjWlB02aFljqmLBIQZZnrumsuewy_uaBDfdU1ZMBxZPU6F9i8MfDdszLqoPK6wd201anM',
      probability: 0.9,
      stage: DealStage.advanced,
    ),
    Deal(
      title: 'Maintenance Contract',
      amount: 'Rp 300jt',
      ownerName: 'PT Maju Jaya',
      ownerInitials: 'PT',
      ownerColor: Colors.orange,
      probability: 0.85,
      stage: DealStage.advanced,
    ),
    // Other: Payment
    Deal(
      title: 'Payment Deal 1',
      amount: 'Rp 50jt',
      ownerName: 'Payment Owner',
      ownerInitials: 'PO',
      ownerColor: Colors.deepOrange,
      probability: 1.0,
      stage: DealStage.payment,
    ),
    // Other: Won
    Deal(
      title: 'Won Deal 1',
      amount: 'Rp 200jt',
      ownerName: 'Won Owner',
      ownerInitials: 'WO',
      ownerColor: Colors.blue,
      probability: 1.0,
      stage: DealStage.won,
    ),
    // Other: Lose
    Deal(
      title: 'Lose Deal 1',
      amount: 'Rp 10jt',
      ownerName: 'Lose Owner',
      ownerInitials: 'LO',
      ownerColor: Colors.red,
      probability: 0.0,
      stage: DealStage.lose,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter deals berdasarkan stage
    final leadMasukDeals =
        allDeals.where((d) => d.stage == DealStage.newDeal).toList();
    final kualifikasiDeals =
        allDeals.where((d) => d.stage == DealStage.qualified).toList();
    final negosiasiDeals =
        allDeals.where((d) => d.stage == DealStage.advanced).toList();
    final otherDeals = allDeals
        .where((d) =>
            d.stage == DealStage.payment ||
            d.stage == DealStage.won ||
            d.stage == DealStage.lose)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deals Pipeline',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'REwOrk CRM',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isListView = !_isListView;
              });
            },
            icon: Icon(_isListView ? Icons.view_kanban : Icons.filter_list),
            tooltip: _isListView ? 'Kanban' : 'List',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.primary,
              elevation: 2,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: _isListView
          ? DealsListView(deals: allDeals) // gunakan widget baru
          : _buildKanbanView(
              leadMasukDeals,
              kualifikasiDeals,
              negosiasiDeals,
              otherDeals,
            ),
    );
  }

  // Kanban View (tampilan default)
  Widget _buildKanbanView(
    List<Deal> leadMasukDeals,
    List<Deal> kualifikasiDeals,
    List<Deal> negosiasiDeals,
    List<Deal> otherDeals,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      children: [
        // Column 1: Lead Masuk (New)
        KanbanColumn(
          title: 'New',
          count: leadMasukDeals.length,
          potential: 'Rp 120jt',
          color: Colors.blue.shade400,
          cards: leadMasukDeals.map((deal) {
            return KanbanCard(
              title: deal.title,
              amount: deal.amount,
              ownerName: deal.ownerName,
              ownerInitials: deal.ownerInitials,
              ownerImage: deal.ownerImage,
              ownerColor: deal.ownerColor,
              probability: deal.probability,
              progressColor: Colors.blue,
            );
          }).toList(),
        ),
        const SizedBox(width: 16),

        // Column 2: Kualifikasi (Qualified)
        KanbanColumn(
          title: 'Qualified',
          count: kualifikasiDeals.length,
          potential: 'Rp 450jt',
          color: Colors.yellow.shade400,
          cards: kualifikasiDeals.map((deal) {
            return KanbanCard(
              title: deal.title,
              amount: deal.amount,
              ownerName: deal.ownerName,
              ownerInitials: deal.ownerInitials,
              ownerImage: deal.ownerImage,
              ownerColor: deal.ownerColor,
              probability: deal.probability,
              progressColor: Colors.yellow,
            );
          }).toList(),
        ),
        const SizedBox(width: 16),

        // Column 3: Negosiasi (Advanced)
        KanbanColumn(
          title: 'Advanced',
          count: negosiasiDeals.length,
          potential: 'Rp 800jt',
          color: Colors.green.shade400,
          cards: negosiasiDeals.map((deal) {
            return KanbanCard(
              title: deal.title,
              amount: deal.amount,
              ownerName: deal.ownerName,
              ownerInitials: deal.ownerInitials,
              ownerImage: deal.ownerImage,
              ownerColor: deal.ownerColor,
              probability: deal.probability,
              progressColor: Colors.green,
            );
          }).toList(),
        ),
        const SizedBox(width: 16),

        // Column 4: Other (Payment, Won, Lose)
        KanbanColumn(
          title: 'Other',
          count: otherDeals.length,
          potential: 'Rp 260jt',
          color: Colors.grey.shade600,
          cards: otherDeals.map((deal) {
            return KanbanCard(
              title: deal.title,
              amount: deal.amount,
              ownerName: deal.ownerName,
              ownerInitials: deal.ownerInitials,
              ownerImage: deal.ownerImage,
              ownerColor: deal.ownerColor,
              probability: deal.probability,
              progressColor: Colors.grey,
              backgroundColor:
                  getBackgroundColorForStage(deal.stage), // pakai helper
            );
          }).toList(),
        ),
      ],
    );
  }
}
