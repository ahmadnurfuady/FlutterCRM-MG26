import 'package:flutter/material.dart';

class LeadsReport extends StatelessWidget {
  const LeadsReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Leads Report',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                splashRadius: 20,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Table Head - Hanya muncul di layar lebar (> 800px untuk tabel lengkap)
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.shade100)),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text('Name & Company', style: _headerStyle)),
                      Expanded(
                          flex: 3, child: Text('Email', style: _headerStyle)),
                      Expanded(
                          flex: 3,
                          child: Text('Project Duration', style: _headerStyle)),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('Status', style: _headerStyle))),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // Rows
          const SizedBox(height: 8),
          ...leads.asMap().entries.map((entry) {
            final index = entry.key;
            final lead = entry.value;
            return _LeadRow(lead: lead, index: index);
          }),
        ],
      ),
    );
  }
}

class _LeadRow extends StatelessWidget {
  final Map<String, String> lead;
  final int index;

  const _LeadRow({required this.lead, required this.index});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;

        return Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color:
                index % 2 == 1 ? const Color(0xFFF8FAFC) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: isDesktop
              ? Row(
                  // Tampilan Desktop (Horizontal)
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lead['name']!, style: _nameStyle),
                          Text(lead['company']!, style: _subTextStyle),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(lead['email']!,
                          style: _textStyle, overflow: TextOverflow.ellipsis),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lead['duration']!, style: _textStyle),
                          Text(lead['days']!, style: _subTextStyle),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child:
                          Center(child: _StatusChip(status: lead['status']!)),
                    ),
                  ],
                )
              : Column(
                  // Tampilan Mobile (Vertical Stack)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(lead['name']!, style: _nameStyle)),
                        _StatusChip(status: lead['status']!),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(lead['company']!, style: _subTextStyle),
                    const Divider(height: 20, color: Color(0xFFEDF2F7)),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(lead['email']!,
                                style: _textStyle,
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text('${lead['duration']} (${lead['days']})',
                            style: _textStyle),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'Won':
        color = const Color(0xFF10B981);
        break;
      case 'Lost':
        color = const Color(0xFFEF4444);
        break;
      default:
        color = const Color(0xFFF59E0B);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

// Styles
const _headerStyle = TextStyle(
    fontSize: 13, color: Color(0xFF94A3B8), fontWeight: FontWeight.w600);
const _nameStyle = TextStyle(
    fontWeight: FontWeight.bold, color: Color(0xFF1E293B), fontSize: 14);
const _textStyle = TextStyle(color: Color(0xFF334155), fontSize: 13);
const _subTextStyle = TextStyle(color: Color(0xFF64748B), fontSize: 12);

const List<Map<String, String>> leads = [
  {
    'name': 'Andi Pratama',
    'email': 'andi.pratama@sinarabadi.co.id',
    'company': 'PT Sinar Abadi Sejahtera',
    'duration': '01 Jan - 31 Des 2026',
    'days': '365 Days',
    'status': 'Lost'
  },
  {
    'name': 'Kevin Maulana',
    'email': 'kevin@novadigital.io',
    'company': 'PT Inovasi Digital Nusantara',
    'duration': '01 Jan - 31 Des 2026',
    'days': '365 Days',
    'status': 'Won'
  },
  {
    'name': 'Muhammad Haidar',
    'email': 'mhaidarhylmi@gmail.com',
    'company': 'PT Teknologi Cerdas Bangsa',
    'duration': '01 Jan - 31 Des 2026',
    'days': '365 Days',
    'status': 'Process'
  },
];
