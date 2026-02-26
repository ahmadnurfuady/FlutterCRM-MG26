import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primary,
                      AppTheme.primary.withValues(alpha: 0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 2),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDZEoWhWObIDWYklpk7iWQ6PHlcHLXQja9evtn1Nu20ymVgb5Pj3THHHluHsh56sHnd-BhhhgSqos8PFcPHR8MhhL84nC1JE3QjLhOcd2Orvpl7FtrPiSRLeaWN1gwcJmpD_e7c0qHr3xzMGCjctDPlXKTMO8NjL1Xp_ZpiZJ_6hrIkU52lgS9hKsOwzASHCK79uT4l6Md-jbU64yPtPKQo0cMQBY7dxhrTZsVIMp5crbN6l86fmXdWaZGgFLpIFekodI9GRAK-4Zc'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_outlined),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Good Morning,',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: const [
                TextSpan(text: 'Hello, '),
                TextSpan(
                  text: 'Budi!',
                  style: TextStyle(color: AppTheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
