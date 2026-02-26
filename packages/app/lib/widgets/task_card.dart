import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

enum TaskStatus { normal, overdue, today, completed }

class TaskCard extends StatelessWidget {
  final String title;
  final String assignee;
  final String timeLabel;
  final String? avatarUrl;
  final TaskStatus status;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.assignee,
    required this.timeLabel,
    this.avatarUrl,
    this.status = TaskStatus.normal,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color borderColor = Colors.transparent;
    Color timeColor = theme.iconTheme.color!;
    Color? updateBadgeColor;
    Color? updateBadgeTextColor;

    if (status == TaskStatus.overdue) {
      borderColor = AppTheme.danger;
      updateBadgeColor = AppTheme.danger.withValues(alpha: 0.1);
      updateBadgeTextColor = AppTheme.danger;
    } else if (status == TaskStatus.today) {
      borderColor = AppTheme.warning;
      timeColor = AppTheme.warning;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(
            color: status == TaskStatus.normal || status == TaskStatus.completed
                ? Colors.transparent
                : borderColor,
            width: 4,
          ),
          top: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
          right: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
          bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 12),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  value: isCompleted,
                  onChanged: (val) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: theme.dividerColor,
                    width: 2,
                  ),
                  activeColor: AppTheme.primary,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                      color: isCompleted ? theme.disabledColor : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (!isCompleted) ...[
                    Row(
                      children: [
                        Icon(Icons.person,
                            size: 16, color: theme.iconTheme.color),
                        const SizedBox(width: 4),
                        Text(
                          assignee,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (updateBadgeColor != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: updateBadgeColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          timeLabel,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: updateBadgeTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: timeColor),
                          const SizedBox(width: 4),
                          Text(
                            timeLabel,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: timeColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ]
                ],
              ),
            ),
            if (avatarUrl != null && !isCompleted)
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(avatarUrl!),
              )
            else if (!isCompleted)
              IconButton(
                icon: Icon(Icons.more_vert, color: theme.iconTheme.color),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
          ],
        ),
      ),
    );
  }
}
