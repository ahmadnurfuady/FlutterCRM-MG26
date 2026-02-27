import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/models/company.dart';
import 'package:crm_dashboard/data/mock_companies.dart';
import 'package:crm_dashboard/widgets/companies/companies_header.dart';
import 'package:crm_dashboard/widgets/companies/company_list_item.dart';
import 'package:crm_dashboard/widgets/contacts/search_and_filter.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  Map<String, List<Company>> get groupedCompanies {
    final Map<String, List<Company>> grouped = {};

    for (var company in mockCompanies) {
      final letter = company.name[0].toUpperCase();

      if (!grouped.containsKey(letter)) {
        grouped[letter] = [];
      }

      grouped[letter]!.add(company);
    }

    final sortedKeys = grouped.keys.toList()..sort();

    final Map<String, List<Company>> sortedGrouped = {};

    for (var key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }

    return sortedGrouped;
  }

  @override
  Widget build(BuildContext context) {
    final companies = groupedCompanies;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            /// HEADER + SEARCH + FILTER (BACKGROUND BIRU)
            Container(
              color: AppTheme.primary,
              child: Column(
                children: [
                  CompaniesHeader(
                    count: mockCompanies.length,
                    onAddPressed: () {},
                  ),
                  const SearchAndFilter(),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            /// LIST COMPANY
            Expanded(
              child: CustomScrollView(
                slivers: [
                  for (var entry in companies.entries)
                    SliverMainAxisGroup(
                      slivers: [
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: _SectionHeaderDelegate(entry.key),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final company = entry.value[index];

                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: CompanyListItem(company: company),
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
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
