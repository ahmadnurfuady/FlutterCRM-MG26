import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/models/contact.dart';

class ContactDetailsScreen extends StatelessWidget {
  final Contact contact;

  const ContactDetailsScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverAppBar(context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      _buildProfileSection(context),
                      const SizedBox(height: 24),
                      _buildQuickActions(context),
                      const SizedBox(height: 24),
                      _buildContactInfoCard(context),
                      const SizedBox(height: 24),
                      _buildHistorySection(context),
                      const SizedBox(height: 24),
                      _buildRelatedDealsSection(context),
                      const SizedBox(height: 100), // Spacing for bottom nav
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Floating Bottom Navigation (simulated as fixed for this screen)
          // In a real app, this might be the main scaffold's bottom nav,
          // but for this specific screen request, I'll add a placeholder or rely on the main screen if it persists.
          // However, the design shows a bottom nav specific to the app.
          // If this screen is pushed, the main bottom nav might be hidden.
          // I will ignore the bottom nav for now as it's usually part of the main shell,
          // unless the user wants this screen to replace the main shell content.
          // Given standard navigation, this screen would be pushed ON TOP of the main shell, hiding the bottom nav.
          // But the design shows it. I'll assume it's part of the main shell or I should replicate it visually
          // if this is a standalone view.
          // For now, I'll leave it out as it likely belongs to the main dashboard shell.
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
      pinned: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        color: AppTheme.primary,
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      title: Text(
        'CONTACT DETAILS',
        style: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child:
              const Text('Edit', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Theme.of(context).dividerColor,
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple, // Fallback or derived
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  contact.initials ?? 'AW',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppTheme.emerald500,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 4),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          contact.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          '${contact.role}, ${contact.company}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.slate500,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.call, 'label': 'Call', 'color': AppTheme.primary},
      {
        'icon': Icons.chat_bubble,
        'label': 'WhatsApp',
        'color': AppTheme.emerald500
      },
      {'icon': Icons.email, 'label': 'Email', 'color': AppTheme.orange500},
      {'icon': Icons.add, 'label': 'Log', 'color': AppTheme.slate500},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: actions.map((action) {
        final color = action['color'] as Color;
        return Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: Icon(
                action['icon'] as IconData,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              action['label'] as String,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.slate500,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildContactInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTACT INFORMATION',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(context, Icons.smartphone, 'Mobile',
              contact.phone ?? '+62 812 3456 7890',
              isLink: true),
          const SizedBox(height: 16),
          _buildInfoRow(context, Icons.alternate_email, 'Work Email',
              contact.email ?? 'andi.w@majujaya.com',
              isLink: true),
          const SizedBox(height: 16),
          /* Company with address */
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.business, color: AppTheme.slate400, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context)
                                .dividerColor
                                .withValues(alpha: 0.5))),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Company',
                          style: TextStyle(
                              color: AppTheme.slate500, fontSize: 13)),
                      const SizedBox(height: 2),
                      Text(contact.company,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      if (contact.address != null) ...[
                        const SizedBox(height: 4),
                        Text(contact.address!,
                            style: const TextStyle(
                                color: AppTheme.slate400, fontSize: 12)),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          /* Tags */
          Wrap(
            spacing: 8,
            children: [
              _buildTag(context, '🔥 Hot Lead',
                  textColor: Colors.red[200]!,
                  bgColor: Colors.red[900]!.withValues(alpha: 0.3),
                  borderColor: Colors.red[900]!.withValues(alpha: 0.5)),
              _buildTag(context, 'Tech Industry',
                  textColor: AppTheme.slate400,
                  bgColor: AppTheme.slate800.withValues(alpha: 0.5),
                  borderColor: AppTheme.slate500.withValues(alpha: 0.3)),
              if (contact.tags != null)
                for (var tag in contact.tags!)
                  _buildTag(context, tag,
                      textColor: AppTheme.slate400,
                      bgColor: AppTheme.slate800.withValues(alpha: 0.5),
                      borderColor: AppTheme.slate500.withValues(alpha: 0.3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String label, String value,
      {bool isLink = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.slate400, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style:
                      const TextStyle(color: AppTheme.slate500, fontSize: 13)),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: isLink
                      ? AppTheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text,
      {required Color textColor,
      required Color bgColor,
      required Color borderColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildHistorySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HISTORY',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
              ),
              const Text(
                'View All',
                style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Positioned(
                left: 19,
                top: 0,
                bottom: 20,
                child:
                    Container(width: 2, color: Theme.of(context).dividerColor),
              ),
              Column(
                children: [
                  _buildHistoryItem(
                    context,
                    icon: Icons.phone_in_talk,
                    iconColor: AppTheme.primary,
                    iconBg: AppTheme.primary.withValues(
                        alpha:
                            0.1), // Adjusted for dark mode manually if needed
                    title: 'Outbound Call',
                    date: 'Feb 14',
                    description:
                        'Discussed budget allocation for Q2. Client seemed positive.',
                    tag: '15m 32s',
                  ),
                  _buildHistoryItem(
                    context,
                    icon: Icons.chat_bubble,
                    iconColor: AppTheme.emerald500,
                    iconBg: AppTheme.emerald500.withValues(alpha: 0.1),
                    title: 'WhatsApp Follow-up',
                    date: 'Feb 12',
                    description: 'Sent pricing deck v2 as requested.',
                  ),
                  _buildHistoryItem(
                    context,
                    icon: Icons.email,
                    iconColor: AppTheme.orange500,
                    iconBg: AppTheme.orange500.withValues(alpha: 0.1),
                    title: 'Proposal Sent',
                    date: 'Feb 10',
                    description:
                        'Initial proposal for Website Redesign sent to andi.w@majujaya.com.',
                    isLast: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String date,
    required String description,
    String? tag,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? iconColor.withValues(alpha: 0.2)
                  : iconBg,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).cardTheme.color!,
                  width: 3), // Simulating the gap
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                    Text(date,
                        style: const TextStyle(
                            color: AppTheme.slate500, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(
                        color: AppTheme.slate500, fontSize: 12)),
                if (tag != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).dividerColor.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Theme.of(context).dividerColor),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.schedule,
                            size: 12, color: AppTheme.slate500),
                        const SizedBox(width: 4),
                        Text(tag,
                            style: const TextStyle(
                                color: AppTheme.slate500,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedDealsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RELATED DEALS',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.add, size: 16, color: AppTheme.slate500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Website Redesign',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        const SizedBox(height: 2),
                        const Text('ID: #DL-2024-089',
                            style: TextStyle(
                                color: AppTheme.slate500, fontSize: 11)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[900]?.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.blue[800]!.withValues(alpha: 0.5)),
                      ),
                      child: const Text('NEGOSIASI',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('VALUE',
                            style: TextStyle(
                                color: AppTheme.slate500,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Text('Rp 75.000.000',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    /* Avatars */
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple]),
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                /* Progress Bar */
                Stack(
                  children: [
                    Container(
                      height: 6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
