import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Tentukan jumlah kolom berdasarkan lebar
        int crossAxisCount = 2; // default mobile
        if (constraints.maxWidth > 600)
          crossAxisCount =
              2; // tablet (tetap 2 kolom, tapi nanti kita atur layoutnya)
        if (constraints.maxWidth > 1100) crossAxisCount = 4; // desktop

        // Hitung lebar setiap kartu agar pas dengan jumlah kolom dan spacing
        double spacing = 16; // jarak antar kartu (horizontal & vertikal)
        double totalSpacing = spacing * (crossAxisCount - 1);
        double cardWidth =
            (constraints.maxWidth - totalSpacing) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            SizedBox(
              width: cardWidth,
              child: const _SummaryCard(
                icon: Icons.people_outline,
                value: '18.6K',
                label: 'Total Contacts',
                percentage: '12%',
                isUp: true,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const _SummaryCard(
                icon: Icons.business_rounded,
                value: '12.4K',
                label: 'Total Companies',
                percentage: '8%',
                isUp: true,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const _SummaryCard(
                icon: Icons.business_center_outlined,
                value: '852',
                label: 'Total Deals',
                percentage: '5%',
                isUp: false,
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: const _SummaryCard(
                icon: Icons.assignment_late_outlined,
                value: '2.4K',
                label: 'Total Tasks',
                percentage: '18%',
                isUp: true,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String percentage;
  final bool isUp;

  const _SummaryCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.percentage,
    this.isUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris ikon dan persentase
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: const Color(0xFF475569)),
              ),
              Row(
                children: [
                  Icon(
                    isUp ? Icons.trending_up : Icons.trending_down,
                    size: 12,
                    color: isUp ? const Color(0xFF10B981) : Colors.red,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    percentage,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isUp ? const Color(0xFF10B981) : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Label dan nilai
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
