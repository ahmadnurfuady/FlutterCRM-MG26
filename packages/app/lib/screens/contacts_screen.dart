
import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/models/contact.dart';
import 'package:crm_dashboard/data/mock_contacts.dart';
import 'package:crm_dashboard/widgets/contacts/contacts_header.dart';
import 'package:crm_dashboard/widgets/contacts/search_and_filter.dart';
import 'package:crm_dashboard/widgets/contacts/contact_list_item.dart';

import 'package:crm_dashboard/widgets/contacts/add_contact_form.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  // Group contacts by first letter
  Map<String, List<Contact>> get groupedContacts {
    final Map<String, List<Contact>> grouped = {};
    for (var contact in mockContacts) {
      final letter = contact.name[0].toUpperCase();
      if (!grouped.containsKey(letter)) {
        grouped[letter] = [];
      }
      grouped[letter]!.add(contact);
    }
    // Sort keys
    final sortedKeys = grouped.keys.toList()..sort();
    final Map<String, List<Contact>> sortedGrouped = {};
    for (var key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }
    return sortedGrouped;
  }

  void _showAddContactForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddContactForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contacts = groupedContacts;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ContactsHeader(
              count: mockContacts.length,
              onAddPressed: _showAddContactForm,
            ),
            const SearchAndFilter(),
            const SizedBox(height: 16),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  for (var entry in contacts.entries) ...[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SectionHeaderDelegate(entry.key),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final contact = entry.value[index];
                          // Add border logic if needed, but keeping it simple for now
                          return Container(
                             decoration: BoxDecoration(
                               border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
                             ),
                            child: ContactListItem(contact: contact)
                          );
                        },
                        childCount: entry.value.length,
                      ),
                    ),
                  ],
                    // Add padding at bottom for FAB
                   const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _SectionHeaderDelegate(this.title);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95), // Backdrop blur effect simulation
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.slate500,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant _SectionHeaderDelegate oldDelegate) {
    return oldDelegate.title != title;
  }
}
