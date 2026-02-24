import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class TeamManagementTab extends StatelessWidget {
  const TeamManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team Members',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 18,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage user access and roles',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.slate500,
                          ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18, color: Colors.white),
                  label: const Text('Invite', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Team Members List
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Column(
              children: [
                _TeamMemberTile(
                  name: 'Budi Santoso',
                  email: 'budi.s@rework.com',
                  role: 'Admin',
                  roleColor: Color(0xFFE9D5FF), 
                  roleTextColor: Color(0xFF6B21A8), 
                  roleBorderColor: Color(0xFFD8B4FE),
                  initials: 'BS',
                  initialsBg: Color(0xFFDBEAFE),
                  initialsColor: Color(0xFF2563EB),
                  isStar: true,
                ),
                Divider(height: 1, thickness: 1, color: Theme.of(context).dividerColor),
                _TeamMemberTile(
                  name: 'Andi Wijaya',
                  email: 'andi.w@rework.com',
                  role: 'Manager',
                   roleColor: Color(0xFFDBEAFE), 
                  roleTextColor: Color(0xFF1E40AF), 
                  roleBorderColor: Color(0xFFBFDBFE),
                  initials: 'AW',
                  initialsBg: Color(0xFFD1FAE5),
                  initialsColor: Color(0xFF059669),
                ),
                Divider(height: 1, thickness: 1, color: Theme.of(context).dividerColor),
                _TeamMemberTile(
                  name: 'Siti Putri',
                  email: 'siti.putri@rework.com',
                  role: 'Sales',
                  roleColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF334155) // Dark mode slate
                      : Color(0xFFF1F5F9), // Light mode slate
                  roleTextColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFFCBD5E1) 
                      : Color(0xFF475569),
                  roleBorderColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF475569) 
                      : Color(0xFFE2E8F0),
                  initials: 'SP',
                  initialsBg: Color(0xFFFFEDD5),
                  initialsColor: Color(0xFFEA580C),
                ),
                Divider(height: 1, thickness: 1, color: Theme.of(context).dividerColor),
                _TeamMemberTile(
                  name: 'Rian Diana',
                  email: 'rian.d@rework.com',
                  role: 'Sales',
                  roleColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF334155) 
                      : Color(0xFFF1F5F9),
                  roleTextColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFFCBD5E1) 
                      : Color(0xFF475569),
                  roleBorderColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF475569) 
                      : Color(0xFFE2E8F0),
                  initials: 'RD',
                  initialsBg: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF1F2937) 
                      : Color(0xFFF3F4F6),
                  initialsColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF9CA3AF) 
                      : Color(0xFF6B7280),
                  isOpacity: true,
                  status: 'Pending',
                ),
                Divider(height: 1, thickness: 1, color: Theme.of(context).dividerColor),
                _TeamMemberTile(
                  name: 'Dewi Kartika',
                  email: 'dewi.k@rework.com',
                  role: 'Sales',
                  roleColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF334155) 
                      : Color(0xFFF1F5F9),
                  roleTextColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFFCBD5E1) 
                      : Color(0xFF475569),
                  roleBorderColor: Theme.of(context).brightness == Brightness.dark 
                      ? Color(0xFF475569) 
                      : Color(0xFFE2E8F0),
                  initials: 'DK',
                  initialsBg: Color(0xFFFCE7F3),
                  initialsColor: Color(0xFFDB2777),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Plan Usage Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF172554).withOpacity(0.3)
                  : Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFF1E3A8A).withOpacity(0.5)
                    : Color(0xFFDBEAFE),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppTheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Team Plan Usage',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Color(0xFFDBEAFE)
                                  : Color(0xFF1E3A8A),
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'You have used 5 of 10 seats available in your current plan. Upgrade to Pro for unlimited team members.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Color(0xFF93C5FD)
                                  : Color(0xFF1D4ED8),
                              height: 1.5,
                            ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Upgrade Plan',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamMemberTile extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final Color roleColor;
  final Color roleTextColor;
  final Color roleBorderColor;
  final String initials;
  final Color initialsBg;
  final Color initialsColor;
  final bool isStar;
  final bool isOpacity;
  final String? status;

  const _TeamMemberTile({
    required this.name,
    required this.email,
    required this.role,
    required this.roleColor,
    required this.roleTextColor,
    required this.roleBorderColor,
    required this.initials,
    required this.initialsBg,
    required this.initialsColor,
    this.isStar = false,
    this.isOpacity = false,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isOpacity ? 0.75 : 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark 
                        ? initialsBg.withOpacity(0.2) 
                        : initialsBg,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark 
                          ? initialsColor.withOpacity(0.8) 
                          : initialsColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (isStar)
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark 
                              ? Color(0xFF713F12).withOpacity(0.5) 
                              : Color(0xFFFEF9C3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.star,
                          size: 14,
                          color: Color(0xFFEAB308),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark 
                              ? roleColor.withOpacity(0.2) 
                              : roleColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? roleBorderColor.withOpacity(0.3) 
                                : roleBorderColor,
                          ),
                        ),
                        child: Text(
                          role,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? roleTextColor 
                                : roleTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (status != null) ...[
                        const Spacer(),
                         Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? Color(0xFFFFF7ED).withOpacity(0.1) 
                                : Color(0xFFFFF7ED),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xFFFFE4E6),
                            ),
                          ),
                          child: Text(
                            status!,
                            style: TextStyle(
                              color: Color(0xFFF97316),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.slate500,
                          fontSize: 12,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (status == null)
              IconButton(
                icon: Icon(Icons.more_vert, color: AppTheme.slate400),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
            else 
               IconButton(
                icon: Icon(Icons.more_vert, color: AppTheme.slate400),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
      ),
    );
  }
}
