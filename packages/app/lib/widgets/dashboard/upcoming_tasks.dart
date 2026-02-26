import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Tasks',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const _TaskItem(
          title: 'Follow up PT Maju',
          subtitle: 'Prepare Q3 proposal slides',
          priority: 'High',
          priorityColor: AppTheme.orange500,
          time: 'Today, 2:00 PM',
          isDone: false,
        ),
        const SizedBox(height: 12),
        const _TaskItem(
          title: 'Call CV Abadi',
          subtitle: 'Confirm meeting schedule',
          priority: 'Normal',
          priorityColor: AppTheme.emerald500,
          time: 'Tomorrow, 10:00 AM',
          isDone: false,
        ),
        const SizedBox(height: 12),
        const _TaskItem(
          title: 'Draft Contract #294',
          subtitle: 'Sent to legal team',
          priority: 'Done',
          priorityColor: AppTheme.slate500,
          time: 'Yesterday',
          isDone: true,
        ),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String priority;
  final Color priorityColor;
  final String time;
  final bool isDone;

  const _TaskItem({
    required this.title,
    required this.subtitle,
    required this.priority,
    required this.priorityColor,
    required this.time,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Opacity(
      opacity: isDone ? 0.75 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.dividerColor),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isDone
                      ? AppTheme.primary
                      : theme.iconTheme.color!.withValues(alpha: 0.5),
                  width: 1.5,
                ),
                color: isDone ? AppTheme.primary : Colors.transparent,
              ),
              child: isDone
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: isDone ? TextDecoration.lineThrough : null,
                      color: isDone
                          ? theme.iconTheme.color
                          : theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: priorityColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    priority,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: priorityColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    color: theme.iconTheme.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
