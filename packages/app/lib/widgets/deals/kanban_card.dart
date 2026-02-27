import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class KanbanCard extends StatelessWidget {
  final String title;
  final String amount;
  final String ownerName;
  final String? ownerInitials;
  final String? ownerImage;
  final Color? ownerColor;
  final double probability;
  final Color progressColor;
  final Color? backgroundColor; // <-- PARAMETER BARU

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
    this.backgroundColor, // <-- KONSTRUKTOR DITAMBAH
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ??
            Theme.of(context).cardTheme.color, // <-- PRIORITAS backgroundColor
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
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
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),

              /// DROPDOWN STAGE
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
                onSelected: (value) {
                  debugPrint("Move to stage: $value");
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "new", child: Text("New")),
                  const PopupMenuItem(
                      value: "qualified", child: Text("Qualified")),
                  const PopupMenuItem(
                      value: "advanced", child: Text("Advanced")),
                  const PopupMenuItem(value: "payment", child: Text("Payment")),
                  const PopupMenuItem(value: "won", child: Text("Won")),
                  const PopupMenuItem(value: "lose", child: Text("Lose")),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          /// AMOUNT
          Text(
            amount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 12),

          /// OWNER
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

          /// PROBABILITY BAR
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF374151)
                        : const Color(0xFFF3F4F6),
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
