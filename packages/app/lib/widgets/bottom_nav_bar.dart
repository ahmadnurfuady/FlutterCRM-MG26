import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.9),
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        height: 80,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _NavItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
                isSelected: selectedIndex == 0,
                onTap: () => onItemSelected(0),
              ),
            ),
            Expanded(
              child: _NavItem(
                icon: Icons.people,
                label: 'Contacts',
                isSelected: selectedIndex == 1,
                onTap: () => onItemSelected(1),
              ),
            ),
            Expanded(
              child: _NavItem(
                icon: Icons.business,
                label: 'Companies',
                isSelected: selectedIndex == 2,
                onTap: () => onItemSelected(2),
              ),
            ),
            Expanded(
              child: _NavItem(
                icon: Icons.monetization_on,
                label: 'Deals',
                isSelected: selectedIndex == 3,
                onTap: () => onItemSelected(3),
              ),
            ),
            Expanded(
              child: _NavItem(
                icon: Icons.check_circle,
                label: 'Tasks',
                isSelected: selectedIndex == 4,
                onTap: () => onItemSelected(4),
              ),
            ),
            Expanded(
              child: _NavItem(
                icon: Icons.more_horiz,
                label: 'More',
                isSelected: selectedIndex == 5,
                onTap: () => onItemSelected(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected ? AppTheme.primary : Theme.of(context).iconTheme.color;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppTheme.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
