import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class KPIGrid extends StatelessWidget {
  const KPIGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.4, // Adjusted for card shape
      children: [
        _KPICard(
          title: 'Revenue',
          value: 'Rp 1.2 M',
          icon: Icons.attach_money,
          change: '12.5%',
          isPositive: true,
          iconColor: AppTheme.primary,
          iconBgColor: AppTheme.primary.withValues(alpha: 0.1),
        ),
        _KPICard(
          title: 'New Leads',
          value: '84',
          icon: Icons.group_add,
          change: '8.3%',
          isPositive: true,
          iconColor: AppTheme.indigo500,
          iconBgColor: AppTheme.indigo500.withValues(alpha: 0.1),
        ),
        _KPICard(
          title: 'Deals Won',
          value: '23',
          icon: Icons.emoji_events,
          change: '2.1%',
          isPositive: false,
          iconColor: AppTheme.orange500,
          iconBgColor: AppTheme.orange500.withValues(alpha: 0.1),
        ),
        _KPICard(
          title: 'Conv. Rate',
          value: '27.4%',
          icon: Icons.pie_chart,
          change: '3.7%',
          isPositive: true,
          iconColor: AppTheme.teal500,
          iconBgColor: AppTheme.teal500.withValues(alpha: 0.1),
        ),
      ],
    );
  }
}

class _KPICard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String change;
  final bool isPositive;
  final Color iconColor;
  final Color iconBgColor;

  const _KPICard({
    required this.title,
    required this.value,
    required this.icon,
    required this.change,
    required this.isPositive,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive
                      ? AppTheme.emerald500.withValues(alpha: 0.1)
                      : AppTheme.rose500.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 10,
                      color:
                          isPositive ? AppTheme.emerald500 : AppTheme.rose500,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      change,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color:
                            isPositive ? AppTheme.emerald500 : AppTheme.rose500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
