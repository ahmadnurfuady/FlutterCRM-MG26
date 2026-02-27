import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class TeamHeader extends StatelessWidget {
  final int count;
  final VoidCallback onAddPressed;

  const TeamHeader({
    super.key,
    required this.count,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 20, 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Teams ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                children: [
                  TextSpan(
                    text: '($count)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
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
