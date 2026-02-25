import 'package:flutter/material.dart';
import 'package:crm_dashboard/models/company.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;

  const CompanyListItem({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: AppTheme.slate200,
        child: Text(
          company.getInitials(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.darkBase,
          ),
        ),
      ),
      title: Text(
        company.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${company.industry} • ${company.city}, ${company.country}',
        style: const TextStyle(
          color: AppTheme.slate500,
          fontSize: 13,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.slate200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${company.employeeCount} employees',
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.subText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
