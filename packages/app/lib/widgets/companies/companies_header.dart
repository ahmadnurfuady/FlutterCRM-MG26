import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class CompaniesHeader extends StatelessWidget {
  final int count;
  final VoidCallback onAddPressed;

  const CompaniesHeader({
    super.key,
    required this.count,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Companies ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              children: [
                TextSpan(
                  text: '($count)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppTheme.slate400,
                      ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onAddPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(12),
              elevation: 4,
              shadowColor: AppTheme.primary.withValues(alpha: 0.4),
            ),
            child: const Icon(Icons.add, size: 24),
          ),
        ],
      ),
    );
  }
}
