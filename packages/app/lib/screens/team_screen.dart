import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/team/team_header.dart';
import 'package:crm_dashboard/widgets/team/add_team_form.dart';
import 'package:crm_dashboard/widgets/contacts/search_and_filter.dart';

class Team {
  final int id;
  final String team;
  final int members;

  Team({required this.id, required this.team, required this.members});
}

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final List<Team> _allTeams = [
    Team(id: 1, team: "Management", members: 4),
    Team(id: 2, team: "Marketing", members: 7),
    Team(id: 3, team: "Design", members: 5),
    Team(id: 4, team: "Finance", members: 3),
    Team(id: 5, team: "Development", members: 12),
    Team(id: 6, team: "Support", members: 6),
    Team(id: 7, team: "Accountants", members: 3),
    Team(id: 8, team: "Business Development", members: 8),
  ];

  Map<String, List<Team>> get groupedTeams {
    final Map<String, List<Team>> grouped = {};

    for (var team in _allTeams) {
      final letter = team.team[0].toUpperCase();
      if (!grouped.containsKey(letter)) {
        grouped[letter] = [];
      }
      grouped[letter]!.add(team);
    }

    final sortedKeys = grouped.keys.toList()..sort();
    final Map<String, List<Team>> sortedGrouped = {};
    for (var key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }
    return sortedGrouped;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final grouped = groupedTeams;

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.backgroundDark : const Color(0xFFF8FAFC),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // HEADER + SEARCH + FILTER
            Container(
              color: AppTheme.primary,
              child: Column(
                children: [
                  TeamHeader(
                    count: _allTeams.length,
                    onAddPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const AddTeamForm(),
                      );
                    },
                  ),
                  const SearchAndFilter(),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Main Content with Sticky Headers
            Expanded(
              child: CustomScrollView(
                slivers: [
                  for (var entry in grouped.entries)
                    SliverMainAxisGroup(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _SectionHeaderDelegate(entry.key),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final team = entry.value[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: isDark
                                              ? AppTheme.slate800
                                              : AppTheme.slate200)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        team.team,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? Colors.white
                                              : AppTheme.slate900,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${team.members} members",
                                      style: TextStyle(
                                        color: isDark
                                            ? AppTheme.slate400
                                            : AppTheme.slate500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.chevron_right,
                                        size: 18, color: AppTheme.slate400),
                                  ],
                                ),
                              );
                            },
                            childCount: entry.value.length,
                          ),
                        ),
                      ],
                    ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 100),
                  ),
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
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
