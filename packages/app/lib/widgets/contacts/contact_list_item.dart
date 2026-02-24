
import 'package:flutter/material.dart';
import 'package:crm_dashboard/models/contact.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

import 'package:crm_dashboard/screens/contact_details_screen.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    // Determine status color based on some logic or hardcoded for now to match design
    Color statusColor = Colors.grey;
    if (contact.isOnline) {
      statusColor = AppTheme.emerald500;
    } else if (contact.name == 'Arthur Dent' || contact.name == 'Clark Kent') {
      statusColor = Colors.amber; // Yellow/Amber
    } else if (contact.name == 'Bob Smith') {
      statusColor = AppTheme.rose500; // Red
    }

    // Determine avatar background color
     List<Color> gradientColors = [Colors.grey, Colors.grey];
    if (contact.initials == 'AW') {
      gradientColors = [Colors.blue, Colors.indigo];
    } else if (contact.initials == 'BS') {
       gradientColors = [Colors.purple, Colors.pink];
    } else if (contact.initials == 'CK') {
       gradientColors = [Colors.amber, Colors.orange];
    } else if (contact.initials == 'BW') {
      // Special case for BW in design - solid background with border
      gradientColors = [const Color(0xFF233040), const Color(0xFF233040)];
    } else if (contact.initials == 'CL') {
       gradientColors = [AppTheme.slate200, AppTheme.slate200];
    }


    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactDetailsScreen(contact: contact),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                if (contact.avatarUrl != null)
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.slate200, width: 1),
                      image: DecorationImage(
                        image: NetworkImage(contact.avatarUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: contact.initials == 'BW' || contact.initials == 'CL' ? null : LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      color: contact.initials == 'BW' || contact.initials == 'CL' ? gradientColors[0] : null,
                      border: contact.initials == 'BW' ? Border.all(color: AppTheme.slate800) : null,
                    ),
                    child: Center(
                      child: Text(
                        contact.initials ?? '',
                        style: TextStyle(
                          color: contact.initials == 'CL' ? AppTheme.slate500 : (contact.initials == 'BW' ? AppTheme.slate400 : Colors.white),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        contact.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      Text(
                        contact.time,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.slate400,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${contact.company} • ${contact.role}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.slate500,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
             const SizedBox(width: 8),
             Icon(
               Icons.chevron_right,
               color: AppTheme.slate200, // Light theme color, might need adjustment for dark
               // Using logic to check brightness for better adaptability could be good, but following design exact color for now
             ),
          ],
        ),
      ),
    );
  }
}
