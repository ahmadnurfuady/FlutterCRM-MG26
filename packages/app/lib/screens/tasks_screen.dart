import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/task_header.dart';
import 'package:crm_dashboard/widgets/segment_control.dart';
import 'package:crm_dashboard/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TaskHeader(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SegmentControl(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                children: [
                  // Quick Add
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.color,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).dividerColor),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.add_task,
                              color: AppTheme.primary),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Add a new task...',
                              border: InputBorder.none,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_upward,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Overdue Section
                  const _SectionHeader(
                    title: 'Overdue',
                    icon: Icons.warning,
                    color: AppTheme.danger,
                  ),
                  const TaskCard(
                    title: 'Call PT Sumber Makmur',
                    assignee: 'Budi Santoso',
                    timeLabel: 'Yesterday',
                    status: TaskStatus.overdue,
                  ),
                  const TaskCard(
                    title: 'Send Contract Draft',
                    assignee: 'Mega Corp',
                    timeLabel: '2 days ago',
                    status: TaskStatus.overdue,
                    avatarUrl:
                        null, // No avatar shown in second card of overdue
                  ),

                  const SizedBox(height: 24),

                  // Today Section
                  const _SectionHeader(
                    title: 'Today',
                    icon: Icons.schedule,
                    color: AppTheme.warning,
                  ),
                  const TaskCard(
                    title: 'Follow up PT Maju',
                    assignee: 'Siti Aminah',
                    timeLabel: '2:00 PM',
                    status: TaskStatus.today,
                    avatarUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBun-NPsSo0EcHUseLhSCVUUXyCLXJEKTVh7eUAo4bK6IBMignPITQH0eVSB1fAHvBtRYVLeloGU1Xx3xEdZcFWkfRa1WXhiDtYidszD8PlSaOxwNIXYZeB2qwyGQ-rUaLp4sTvhU7--Fkbh2zOahZvMhhwa3GK_KgxOau3MenpTCuauvioX5rJQYPCWJc85yq5g8wAj-q6TPb3Hr3of5vSwVleAz36gM2hgav_4-_BkqekvUbj0yFNdWNFVsi0cTl7yL4hs_dQzc8',
                  ),
                  const TaskCard(
                    title: 'Demo Presentation',
                    assignee: 'John Doe',
                    timeLabel: '4:30 PM',
                    status: TaskStatus.today,
                    avatarUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuB2yFvoTw1rkJhZoielZ5h9wFtbHL9mZipGkdNWtBvG21OL0-S44oHzQrOFVYLR5hgt4c6XVJcJGb8hRgKSYr9pMHYDlIxaFXpoguO2bDMaxjKn1Gnw-nFK3ig3CQHde6yZ4DwA9swMYh8cmZjYgIDK_DlWbVjCPpLxHH4XWjFaH67ivnmHzWVh3BEfkEdawbTs0tKDu5OsgBc4Pbjo8DPotUSE98FsvUM6k3YPlrvG-BSJ7zDdNnpagnr8bpABGoSccYtYcwqKK9c',
                  ),

                  const SizedBox(height: 24),

                  // Completed Section
                  Opacity(
                    opacity: 0.6,
                    child: Column(
                      children: [
                        _SectionHeader(
                          title: 'Completed',
                          icon: Icons.expand_more,
                          color: Theme.of(context).disabledColor,
                        ),
                        const TaskCard(
                          title: 'Morning Briefing',
                          assignee:
                              '', // Not needed for completed style in this specific design
                          timeLabel: '9:00 AM',
                          status: TaskStatus.completed,
                          isCompleted: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80), // Padding for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
          ),
        ],
      ),
    );
  }
}
