import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class Company {
  final int id;
  final String name;
  final String email;
  final String company;
  final String status;
  final String updatedAt;
  final String owner;

  Company({
    required this.id,
    required this.name,
    required this.email,
    required this.company,
    required this.status,
    required this.updatedAt,
    required this.owner,
  });
}

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  final List<Company> _companies = [
    Company(
      id: 1,
      name: "TechFlow Solutions",
      email: "contact@techflow.io",
      company: "Main Enterprise",
      status: "Active",
      updatedAt: "2023-10-24",
      owner: "Alex Graham",
    ),
    Company(
      id: 2,
      name: "Nexus Digital",
      email: "support@nexus.com",
      company: "Sub-Agency",
      status: "Inactive",
      updatedAt: "2023-10-22",
      owner: "Sarah Jenkins",
    ),
    Company(
      id: 3,
      name: "Green Horizon Inc",
      email: "info@greenhorizon.com",
      company: "Eco Group",
      status: "Active",
      updatedAt: "2023-10-20",
      owner: "Michael Chen",
    ),
    Company(
      id: 4,
      name: "Quantum Leap Ltd",
      email: "hello@quantum.co",
      company: "Research Division",
      status: "Active",
      updatedAt: "2023-10-18",
      owner: "Alex Graham",
    ),
    Company(
      id: 5,
      name: "Stellar Softwares",
      email: "admin@stellar.net",
      company: "Global Tech",
      status: "Inactive",
      updatedAt: "2023-10-15",
      owner: "Jessica Alba",
    ),
  ];

  int _currentPage = 1;
  final int _totalCompanies = 18600;
  int _itemsPerPage = 10;
  final List<int> _selectedIds = [];
  bool _selectAllFiltered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Companies',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsHeader(),
              const SizedBox(height: 20),
              _buildActionBar(),
              const SizedBox(height: 16),
              _buildTableContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${_totalCompanies.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} Total Companies',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.refresh, size: 16),
          label: const Text('Update', style: TextStyle(fontSize: 12)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey.shade700,
            elevation: 0,
            side: BorderSide(color: Colors.grey.shade300),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row 1: Search and Filter
          Row(
            children: [
              _buildIconButton(Icons.filter_list, onPressed: () {}),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Name',
                      hintStyle: const TextStyle(fontSize: 13),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppTheme.primary),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildIconButton(Icons.search,
                  onPressed: () {}, backgroundColor: Colors.grey.shade100),
            ],
          ),
          const SizedBox(height: 12),
          // Row 2: Show items & Actions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text('Show', style: TextStyle(fontSize: 13)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: _itemsPerPage,
                      items: [10, 25, 50, 100].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString(),
                              style: const TextStyle(fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() => _itemsPerPage = val!);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                _buildActionButton(
                  label: 'Add New',
                  icon: Icons.add,
                  onPressed: () {},
                  isPrimary: true,
                ),
                const SizedBox(width: 8),
                _buildActionButton(
                  label: 'Download',
                  icon: Icons.download,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                _buildActionButton(
                  label: 'Bulk Edit',
                  icon: Icons.edit,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                _buildIconButton(
                  Icons.delete_outline,
                  onPressed: () {},
                  color: Colors.red,
                  borderColor: Colors.red.shade200,
                  size: 36,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildPaginationHeader(),
          const Divider(height: 1),
          _buildDataTable(),
          if (_companies.isEmpty) _buildEmptyState(),
        ],
      ),
    );
  }

  Widget _buildPaginationHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: _selectAllFiltered,
                  onChanged: (val) {
                    setState(() => _selectAllFiltered = val!);
                  },
                  activeColor: AppTheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Select all filtered result',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Page',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 40,
                    height: 32,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: '$_currentPage'),
                      style: const TextStyle(fontSize: 12),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.primary)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'of ${(_totalCompanies / _itemsPerPage).ceil()}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildPaginationButton(Icons.chevron_left,
                      onPressed: _currentPage > 1 ? () {} : null),
                  const SizedBox(width: 8),
                  _buildPaginationButton(Icons.chevron_right, onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationButton(IconData icon, {VoidCallback? onPressed}) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _buildDataTable() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.grey.shade100),
      child: Scrollbar(
        thickness: 4,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 24,
            headingRowHeight: 48,
            dataRowHeight: 60,
            horizontalMargin: 16,
            showCheckboxColumn: true,
            columns: [
              _buildSortableColumn('Company Name'),
              _buildSortableColumn('Info Company'),
              _buildSortableColumn('Associated with'),
              _buildSortableColumn('Type'),
              _buildSortableColumn('Created/Update'),
              _buildSortableColumn('Owner'),
            ],
            rows: _companies.map((company) {
              final isSelected = _selectedIds.contains(company.id);
              return DataRow(
                selected: isSelected,
                onSelectChanged: (val) {
                  setState(() {
                    if (val!) {
                      _selectedIds.add(company.id);
                    } else {
                      _selectedIds.remove(company.id);
                    }
                  });
                },
                cells: [
                  DataCell(Text(company.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF1E293B)))),
                  DataCell(Text(company.email,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.grey))),
                  DataCell(Text(company.company,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.grey))),
                  DataCell(_buildStatusBadge(company.status)),
                  DataCell(Text(company.updatedAt,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.grey))),
                  DataCell(Text(company.owner,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.grey))),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  DataColumn _buildSortableColumn(String label) {
    return DataColumn(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.unfold_more, size: 14, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final isActive = status == 'Active';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: isActive ? const Color(0xFF15803D) : const Color(0xFF475569),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search, size: 40, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 16),
            const Text(
              'No companies found',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Start adding companies to see them here',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon,
      {required VoidCallback onPressed,
      Color? color,
      Color? backgroundColor,
      Color? borderColor,
      double size = 40}) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(color: borderColor ?? Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: size * 0.5, color: color ?? Colors.black),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildActionButton(
      {required String label,
      required IconData icon,
      required VoidCallback onPressed,
      bool isPrimary = false}) {
    return SizedBox(
      height: 36,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 16),
        label: Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppTheme.primary : Colors.white,
          foregroundColor: isPrimary ? Colors.white : Colors.grey.shade700,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          side: isPrimary ? null : BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
