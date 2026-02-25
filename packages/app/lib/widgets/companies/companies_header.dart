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
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Companies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count total companies',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.slate500,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add),
            label: const Text('Add Company'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.darkHover, // sesuaikan dengan tema Anda
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
