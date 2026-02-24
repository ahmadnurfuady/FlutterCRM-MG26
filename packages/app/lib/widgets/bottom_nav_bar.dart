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
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
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
            _NavItem(
              icon: Icons.dashboard,
              label: 'Dashboard',
              isSelected: selectedIndex == 0,
              onTap: () => onItemSelected(0),
            ),
            _NavItem(
              icon: Icons.people,
              label: 'Contacts',
              isSelected: selectedIndex == 1,
              onTap: () => onItemSelected(1),
            ),
            const SizedBox(width: 48), // Space for FAB
            _NavItem(
              icon: Icons.monetization_on,
              label: 'Deals',
              isSelected: selectedIndex == 2,
              onTap: () => onItemSelected(2),
            ),
            _NavItem(
              icon: Icons.check_circle,
              label: 'Tasks',
              isSelected: selectedIndex == 3,
              onTap: () => onItemSelected(3),
            ),
            _NavItem(
              icon: Icons.settings,
              label: 'Settings',
              isSelected: selectedIndex == 4,
              onTap: () => onItemSelected(4),
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
    final color = isSelected ? AppTheme.primary : Theme.of(context).iconTheme.color;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Icon(icon, color: color, size: 28),
                if (isSelected)
                  Positioned(
                    bottom: -8,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
