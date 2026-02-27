import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search name, company, or email...',
              hintStyle: const TextStyle(
                color: AppTheme.slate500,
                fontSize: 14,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppTheme.slate400,
              ),
              filled: true,
              fillColor: Theme.of(context)
                  .cardColor, // Using card color to approximate slate-100/surface-dark
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _FilterChip(
                label: 'Filter',
                icon: Icons.filter_list,
                backgroundColor: Theme.of(context)
                    .dividerColor
                    .withValues(alpha: 0.5), // Approximate slate-200
                textColor: Theme.of(context).textTheme.bodyMedium?.color ??
                    AppTheme.white,
              ),
              const SizedBox(width: 12),
              const _FilterChip(
                label: 'Status: Active',
                icon: Icons.close,
                iconRight: true,
                backgroundColor: Colors.white,
                textColor: AppTheme.primary,
                borderColor: Colors.white,
              ),
              const SizedBox(width: 12),
              _FilterChip(
                label: 'Status',
                icon: Icons.keyboard_arrow_down,
                iconRight: true,
                backgroundColor: Theme.of(context).cardColor,
                textColor: AppTheme.slate500,
                borderColor: Theme.of(context).dividerColor,
              ),
              const SizedBox(width: 12),
              _FilterChip(
                label: 'Owner',
                icon: Icons.keyboard_arrow_down,
                iconRight: true,
                backgroundColor: Theme.of(context).cardColor,
                textColor: AppTheme.slate500,
                borderColor: Theme.of(context).dividerColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool iconRight;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const _FilterChip({
    required this.label,
    this.icon,
    this.iconRight = false,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && !iconRight) ...[
            Icon(icon, size: 18, color: textColor),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          if (icon != null && iconRight) ...[
            const SizedBox(width: 6),
            Icon(icon, size: 18, color: textColor),
          ],
        ],
      ),
    );
  }
}
