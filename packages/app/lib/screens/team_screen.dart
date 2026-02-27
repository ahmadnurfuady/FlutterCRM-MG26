import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'dart:math';

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
  ];

  String _searchQuery = "";
  int _currentPage = 1;
  int _itemsPerPage = 5;
  final List<int> _selectedTeamIds = [];

  final List<int> _itemsPerPageOptions = [5, 10, 25];

  List<Team> get _filteredTeams {
    if (_searchQuery.isEmpty) return _allTeams;
    return _allTeams
        .where((t) => t.team.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  int get _totalPages => max(1, (_filteredTeams.length / _itemsPerPage).ceil());

  List<Team> get _paginatedTeams {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = start + _itemsPerPage;
    if (start >= _filteredTeams.length) return [];
    return _filteredTeams.sublist(start, min(end, _filteredTeams.length));
  }

  bool get _allSelected {
    final paginated = _paginatedTeams;
    return paginated.isNotEmpty &&
        paginated.every((t) => _selectedTeamIds.contains(t.id));
  }

  void _toggleSelectAll(bool? selected) {
    setState(() {
      final paginatedIds = _paginatedTeams.map((t) => t.id).toList();
      if (selected == true) {
        for (var id in paginatedIds) {
          if (!_selectedTeamIds.contains(id)) {
            _selectedTeamIds.add(id);
          }
        }
      } else {
        _selectedTeamIds.removeWhere((id) => paginatedIds.contains(id));
      }
    });
  }

  void _toggleSelectTeam(int id, bool? selected) {
    setState(() {
      if (selected == true) {
        if (!_selectedTeamIds.contains(id)) _selectedTeamIds.add(id);
      } else {
        _selectedTeamIds.remove(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppTheme.backgroundDark : const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          // Dashboard-style Header
          SliverAppBar(
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFF1C2434),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 48, bottom: 16),
              title: LayoutBuilder(
                builder: (context, constraints) {
                  var top = constraints.biggest.height;
                  return top < 100
                      ? const Text(
                          "Team Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox();
                },
              ),
              background: Container(
                padding: const EdgeInsets.fromLTRB(24, 70, 24, 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1C2434), Color(0xFF1C2434)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Team Management',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage your organization teams and members',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Action Bar & Table Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppTheme.surfaceDark : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: isDark ? AppTheme.slate800 : AppTheme.slate200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ACTION BAR
                      _buildActionBar(isDark),

                      // SELECTION & PAGINATION BAR
                      _buildSelectionAndPagination(isDark),

                      // TABLE
                      _buildTable(isDark),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBar(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: isDark ? AppTheme.slate800 : AppTheme.slate200)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Filter Button
              _ActionButton(
                icon: Icons.filter_list,
                onTap: () {},
                isDark: isDark,
              ),
              const SizedBox(width: 12),
              // Search Input
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (val) => setState(() {
                      _searchQuery = val;
                      _currentPage = 1;
                    }),
                    decoration: InputDecoration(
                      hintText: "Search team...",
                      hintStyle: const TextStyle(
                          color: AppTheme.slate400, fontSize: 13),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      filled: true,
                      fillColor:
                          isDark ? AppTheme.backgroundDark : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color:
                                isDark ? AppTheme.slate800 : AppTheme.slate200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color:
                                isDark ? AppTheme.slate800 : AppTheme.slate200),
                      ),
                    ),
                    style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white : AppTheme.slate900),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _ActionButton(
                icon: Icons.search,
                onTap: () {},
                isDark: isDark,
                backgroundColor: isDark
                    ? AppTheme.slate800
                    : AppTheme.slate200.withValues(alpha: 0.3),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Show Dropdown
              Row(
                children: [
                  Text("Show",
                      style: TextStyle(
                          fontSize: 13,
                          color:
                              isDark ? AppTheme.slate400 : AppTheme.slate500)),
                  const SizedBox(width: 8),
                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              isDark ? AppTheme.slate800 : AppTheme.slate200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: _itemsPerPage,
                        items: _itemsPerPageOptions.map((opt) {
                          return DropdownMenuItem<int>(
                            value: opt,
                            child: Text(opt.toString(),
                                style: const TextStyle(fontSize: 13)),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _itemsPerPage = val;
                              _currentPage = 1;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Delete Button
              _ActionButton(
                icon: Icons.delete_outline,
                onTap: () {},
                isDark: isDark,
                iconColor: AppTheme.danger,
                borderColor: AppTheme.danger.withValues(alpha: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionAndPagination(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.backgroundDark.withValues(alpha: 0.3)
            : const Color(0xFFF8FAFC),
        border: Border(
            bottom: BorderSide(
                color: isDark ? AppTheme.slate800 : AppTheme.slate200)),
      ),
      child: Row(
        children: [
          // Select All
          InkWell(
            onTap: () => _toggleSelectAll(!_allSelected),
            child: Row(
              children: [
                Checkbox(
                  value: _allSelected,
                  onChanged: _toggleSelectAll,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  activeColor: AppTheme.primary,
                ),
                Text(
                  "Select all team",
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? AppTheme.slate400 : AppTheme.slate500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Pagination
          Row(
            children: [
              IconButton(
                onPressed: _currentPage > 1
                    ? () => setState(() => _currentPage--)
                    : null,
                icon: const Icon(Icons.chevron_left, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 8),
              const Text("Page",
                  style: TextStyle(fontSize: 13, color: AppTheme.slate500)),
              const SizedBox(width: 8),
              SizedBox(
                width: 40,
                height: 30,
                child: TextField(
                  controller:
                      TextEditingController(text: _currentPage.toString()),
                  onSubmitted: (val) {
                    final p = int.tryParse(val);
                    if (p != null && p > 0 && p <= _totalPages) {
                      setState(() => _currentPage = p);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Text("of $_totalPages",
                  style:
                      const TextStyle(fontSize: 13, color: AppTheme.slate500)),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _currentPage < _totalPages
                    ? () => setState(() => _currentPage++)
                    : null,
                icon: const Icon(Icons.chevron_right, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTable(bool isDark) {
    final teams = _paginatedTeams;

    if (teams.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 60),
        alignment: Alignment.center,
        child: const Column(
          children: [
            Icon(Icons.group_off_outlined, size: 48, color: AppTheme.slate400),
            SizedBox(height: 12),
            Text("No teams found",
                style: TextStyle(color: AppTheme.slate500, fontSize: 14)),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Table Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: isDark ? AppTheme.surfaceDark : Colors.grey.shade50,
          child: const Row(
            children: [
              SizedBox(width: 48), // Checkbox indent
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Text("Team",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .grey, // Adjusted to skip isDark check for const simplicity or keep logic
                        )),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        size: 14, color: Colors.grey),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Text("Number of Members",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        size: 14, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Table Rows
        ...teams.map((team) {
          final isSelected = _selectedTeamIds.contains(team.id);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: isDark ? AppTheme.slate800 : AppTheme.slate200)),
              color: isSelected
                  ? (isDark
                      ? AppTheme.primary.withValues(alpha: 0.1)
                      : Colors.blue.shade50.withValues(alpha: 0.3))
                  : null,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (val) => _toggleSelectTeam(team.id, val),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    team.team,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : AppTheme.slate900,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "${team.members} members",
                    style: TextStyle(
                      color: isDark ? AppTheme.slate400 : AppTheme.slate500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const _ActionButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          border: Border.all(
              color: borderColor ??
                  (isDark ? AppTheme.slate800 : AppTheme.slate200)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: iconColor ?? (isDark ? Colors.white : AppTheme.slate900),
        ),
      ),
    );
  }
}
