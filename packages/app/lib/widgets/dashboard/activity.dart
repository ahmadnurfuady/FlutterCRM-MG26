import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header dengan Dropdown Style
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'System Activity',
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
                    Text('Daily',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Icon(Icons.arrow_drop_down, color: Colors.grey, size: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Table Header (Desktop Only)
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Container(
                  padding: const EdgeInsets.only(
                      bottom: 12, left: 32), // Space for dots
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.shade100)),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text('Date & Time', style: _headerStyle)),
                      Expanded(
                          flex: 2,
                          child: Text('Action Type', style: _headerStyle)),
                      Expanded(
                          flex: 3,
                          child: Text('Activity Note', style: _headerStyle)),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // Scrollable Activity List
          SizedBox(
            height: 350, // Lebih lega
            child: ListView.builder(
              itemCount: activities.length,
              padding: const EdgeInsets.only(top: 8),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return _ActivityItem(
                    activity: activity, isLast: index == activities.length - 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final Map<String, String> activity;
  final bool isLast;

  const _ActivityItem({required this.activity, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 600;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Dot and Line
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2434).withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFF1C2434), width: 2),
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: Colors.grey.shade100,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),

              // Content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: isDesktop
                      ? Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child:
                                    Text(activity['date']!, style: _dateStyle)),
                            Expanded(
                                flex: 2,
                                child: _buildActionBadge(activity['action']!)),
                            Expanded(
                                flex: 3,
                                child: _buildNote(
                                    activity['user']!, activity['note']!)),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(activity['date']!, style: _dateStyle),
                            const SizedBox(height: 8),
                            _buildActionBadge(activity['action']!),
                            const SizedBox(height: 8),
                            _buildNote(activity['user']!, activity['note']!),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionBadge(String action) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        action,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
            fontSize: 13),
      ),
    );
  }

  Widget _buildNote(String user, String note) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
        children: [
          TextSpan(
              text: user,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          TextSpan(text: note),
        ],
      ),
    );
  }
}

// Styles
const _headerStyle = TextStyle(
    fontSize: 12,
    color: Color(0xFF94A3B8),
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5);
const _dateStyle = TextStyle(color: Color(0xFF64748B), fontSize: 13);

const List<Map<String, String>> activities = [
  {
    'date': '06 Feb 2026 - 10:39 AM',
    'action': 'Edited Task',
    'user': 'Hanan',
    'note': ' changed CRM task status to "In Progress"'
  },
  {
    'date': '06 Feb 2026 - 09:15 AM',
    'action': 'Added Task',
    'user': 'Hanan',
    'note': ' created new lead follow-up'
  },
  {
    'date': '05 Feb 2026 - 04:20 PM',
    'action': 'Team Update',
    'user': 'System',
    'note': ' added Muhammad Haidar to TeamFeature'
  },
];
