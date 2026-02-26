import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
                'Task List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text('February',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                    Icon(Icons.arrow_drop_down,
                        color: Color(0xFF64748B), size: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Table Head - Menggunakan LayoutBuilder agar sama dengan LeadsReport
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.shade100)),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text('Due Date', style: _headerStyle)),
                      Expanded(
                          flex: 4,
                          child: Text('Task Name', style: _headerStyle)),
                      Expanded(
                          flex: 3, child: Text('PIC', style: _headerStyle)),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text('Status', style: _headerStyle))),
                    ],
                  ),
                );
              }
              return const SizedBox
                  .shrink(); // Sembunyikan header di mobile agar ringkas
            },
          ),

          // Task List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return _TaskRow(
                task: task,
                isAlternate: index % 2 == 1,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  final Map<String, String> task;
  final bool isAlternate;

  const _TaskRow({required this.task, required this.isAlternate});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Desktop/Tablet View
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: isAlternate ? const Color(0xFFF8FAFC) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(task['date']!, style: _dateStyle),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    task['name']!,
                    style: _contentStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(task['pic']!,
                      style: _contentStyle, overflow: TextOverflow.ellipsis),
                ),
                Expanded(
                  flex: 2,
                  child: Center(child: _StatusBadge(status: task['status']!)),
                ),
              ],
            ),
          );
        } else {
          // Mobile View - Tampilan List Card yang lebih rapi
          return Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isAlternate ? const Color(0xFFF8FAFC) : Colors.white,
              border: Border.all(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(task['date']!, style: _dateStyle),
                    _StatusBadge(status: task['status']!),
                  ],
                ),
                const SizedBox(height: 8),
                Text(task['name']!,
                    style: _contentStyle.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('PIC: ${task['pic']}', style: _dateStyle),
              ],
            ),
          );
        }
      },
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'Done':
        color = const Color(0xFF10B981);
        break;
      case 'Overdue':
        color = const Color(0xFFEF4444);
        break;
      case 'Process':
        color = const Color(0xFFF59E0B);
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style:
            TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

// Global Styles disamakan dengan Summary & LeadsReport
const _headerStyle = TextStyle(
    fontSize: 12, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold);
const _dateStyle = TextStyle(color: Color(0xFF64748B), fontSize: 12);
const _contentStyle = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF1E293B));

const List<Map<String, String>> tasks = [
  {
    'date': '06 Feb 2026',
    'name': 'Kirim proposal ke Andi, Lorem ipsum dolor.',
    'pic': 'Hanan Zarkasi',
    'status': 'Overdue'
  },
  {
    'date': '06 Feb 2026',
    'name': 'Follow up meeting client',
    'pic': 'Ahmad Fuady',
    'status': 'Done'
  },
  {
    'date': '06 Feb 2026',
    'name': 'Update report bulanan',
    'pic': 'Hanan Zarkasi',
    'status': 'Process'
  },
];
