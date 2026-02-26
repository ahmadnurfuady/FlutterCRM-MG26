import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Tentukan jumlah kolom berdasarkan lebar layar
        int crossAxisCount = 2; // Default mobile
        if (constraints.maxWidth > 600) crossAxisCount = 2; // Tablet
        if (constraints.maxWidth > 1100) crossAxisCount = 4; // Desktop

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16, // Jarak antar baris diperlebar biar lega
          crossAxisSpacing: 16, // Jarak antar kolom
          // Rasio fleksibel: kalau layar sempit, kotak agak meninggi
          childAspectRatio: constraints.maxWidth < 600
              ? 1.5 // Rasio untuk HP (agak kotak/tinggi karena sempit)
              : (constraints.maxWidth > 1200
                  ? 2.2
                  : 2.5), // Rasio Desktop/Tablet
          children: const [
            _SummaryCard(
              icon: Icons.people_outline,
              value: '18.6K',
              label: 'Total Contacts',
              percentage: '12%',
              isUp: true,
            ),
            _SummaryCard(
              icon: Icons.business_rounded,
              value: '12.4K',
              label: 'Total Companies',
              percentage: '8%',
              isUp: true,
            ),
            _SummaryCard(
              icon: Icons.business_center_outlined,
              value: '852',
              label: 'Total Deals',
              percentage: '5%',
              isUp: false, // Contoh jika turun
            ),
            _SummaryCard(
              icon: Icons.assignment_late_outlined,
              value: '2.4K',
              label: 'Total Tasks',
              percentage: '18%',
              isUp: true,
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
      // 1. Kurangi padding agar ruang konten lebih luas
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
        // 2. Gunakan Column agar icon & teks tidak berebut ruang horizontal
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 3. Perkecil ukuran container icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20, // Icon lebih kecil
                  color: const Color(0xFF475569),
                ),
              ),
              // Indikator Persentase (lebih simpel)
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

          // 4. Bagian Teks
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1, // Agar tidak turun ke bawah
                overflow:
                    TextOverflow.ellipsis, // Jika kepanjangan jadi titik-titik
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                // 5. Penting! Agar angka mengecil otomatis jika layar sangat sempit
                fit: TextSelectionTheme.of(context).cursorColor != null
                    ? BoxFit.scaleDown
                    : BoxFit.scaleDown,
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
