import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class KanbanCard extends StatelessWidget {
  final String title;
  final String amount;
  final String ownerName;
  final String? ownerInitials;
  final String? ownerImage;
  final Color? ownerColor;
  final double probability; // 0.0 to 1.0
  final Color progressColor;

  const KanbanCard({
    super.key,
    required this.title,
    required this.amount,
    required this.ownerName,
    this.ownerInitials,
    this.ownerImage,
    this.ownerColor,
    required this.probability,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if we are in dark mode to adjust colors similar to the Tailwind config
    // The design has specific colors for dark mode.
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(8), // rounded-lg
        border: Border.all(
          color: isDark
              ? const Color(0xFF334155)
              : const Color(0xFFE2E8F0), // slate-700 : slate-200 (approx)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Title and Menu Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        // Group hover effect simulation (not perfect in mobile but visualizing intent)
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.more_horiz,
                size: 16,
                color: isDark ? Colors.grey[400] : Colors.grey[400],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Amount
          Text(
            amount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 12),
          // Owner
          Row(
            children: [
              if (ownerImage != null)
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(ownerImage!),
                  backgroundColor: Colors.grey[300],
                )
              else
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ownerColor ?? Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ownerInitials ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                ownerName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? AppTheme.slate400 : AppTheme.slate500,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Probability Bar
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF374151)
                        : const Color(0xFFF3F4F6), // gray-700 : gray-100
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: probability,
                    child: Container(
                      decoration: BoxDecoration(
                        color: progressColor,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 32,
                child: Text(
                  '${(probability * 100).toInt()}%',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppTheme.slate400 : AppTheme.slate500,
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
