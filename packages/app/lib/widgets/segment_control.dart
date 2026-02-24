import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class SegmentControl extends StatelessWidget {
  const SegmentControl({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _SegmentButton(text: 'All', isSelected: false),
          const SizedBox(width: 8),
          _SegmentButton(text: 'Today', isSelected: true, count: 3),
          const SizedBox(width: 8),
          _SegmentButton(text: 'Weekly', isSelected: false, count: 8),
          const SizedBox(width: 8),
          _SegmentButton(text: 'Overdue', isSelected: false, count: 2, isDanger: true),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int? count;
  final bool isDanger;

  const _SegmentButton({
    required this.text,
    this.isSelected = false,
    this.count,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Color backgroundColor = Colors.transparent;
    Color textColor = theme.iconTheme.color!;
    
    if (isSelected) {
      backgroundColor = AppTheme.primary;
      textColor = Colors.white;
    } else if (isDanger) {
       // specific styling for overdue if needed, though design shows it unselected
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withOpacity(0.2) : theme.dividerColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                count.toString(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isSelected ? Colors.white : theme.textTheme.bodySmall?.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
