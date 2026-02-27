import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/custom_text_field.dart';

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key});

  @override
  State<AddCompanyForm> createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  final _nameController = TextEditingController();
  final _ownerController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();
  final _provinceController = TextEditingController();
  final _cityController = TextEditingController();
  final _posCodeController = TextEditingController();

  String? _selectedIndustry;
  String? _selectedSource;
  String? _selectedType;
  String? _selectedDeal;

  final List<String> _industryOptions = [
    'Technology',
    'Finance',
    'Healthcare',
    'Education',
    'Retail',
    'Manufacturing',
    'Consulting',
    'Other'
  ];

  final List<String> _sourceOptions = [
    'Website',
    'Referral',
    'Social Media',
    'Email Campaign',
    'Cold Call',
    'Trade Show',
    'Partner',
    'Other'
  ];

  final List<String> _typeOptions = [
    'Prospect',
    'Customer',
    'Partner',
    'Vendor'
  ];

  final List<String> _dealsOptions = ['Deal 1', 'Deal 2'];

  @override
  void dispose() {
    _nameController.dispose();
    _ownerController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _websiteController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _provinceController.dispose();
    _cityController.dispose();
    _posCodeController.dispose();
    super.dispose();
  }

  void _handleReset() {
    setState(() {
      _nameController.clear();
      _ownerController.clear();
      _emailController.clear();
      _telephoneController.clear();
      _websiteController.clear();
      _addressController.clear();
      _countryController.clear();
      _provinceController.clear();
      _cityController.clear();
      _posCodeController.clear();
      _selectedIndustry = null;
      _selectedSource = null;
      _selectedType = null;
      _selectedDeal = null;
    });
  }

  void _handleSubmit() {
    final data = {
      'companyName': _nameController.text,
      'companyOwner': _ownerController.text,
      'email': _emailController.text,
      'telephone': _telephoneController.text,
      'website': _websiteController.text,
      'industry': _selectedIndustry,
      'address': _addressController.text,
      'country': _countryController.text,
      'province': _provinceController.text,
      'city': _cityController.text,
      'posCode': _posCodeController.text,
      'source': _selectedSource,
      'type': _selectedType,
      'deals': _selectedDeal,
    };

    debugPrint('Submitting Company: $data');
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Company saved successfully!'),
        backgroundColor: AppTheme.emerald500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: isDark ? AppTheme.backgroundDark : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.backgroundDark : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? AppTheme.slate800 : AppTheme.slate200,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Company',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppTheme.slate900,
                    ),
                  ),
                  TextButton(
                    onPressed: _handleReset,
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: AppTheme.danger,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Company Name',
                            placeholder: 'Ex Siap Soft',
                            controller: _nameController,
                            isRequired: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            label: 'Company Owner',
                            placeholder: 'Ex Abdul',
                            controller: _ownerController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Email',
                            placeholder: 'Ex siapsoft@gmail.com',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            label: 'Telephone',
                            placeholder: 'Ex +628234567891',
                            controller: _telephoneController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Website',
                            placeholder: 'Ex siapsoft.com',
                            controller: _websiteController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _CustomDropdownField(
                            label: 'Industry',
                            value: _selectedIndustry,
                            options: _industryOptions,
                            onChanged: (val) =>
                                setState(() => _selectedIndustry = val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Address',
                            placeholder: 'Ex simopomahan',
                            controller: _addressController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            label: 'Country',
                            placeholder: 'Country',
                            controller: _countryController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Province',
                            placeholder: 'Province',
                            controller: _provinceController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            label: 'City',
                            placeholder: 'City',
                            controller: _cityController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Pos Code',
                            placeholder: 'Pos Code',
                            controller: _posCodeController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _CustomDropdownField(
                            label: 'Source',
                            value: _selectedSource,
                            options: _sourceOptions,
                            onChanged: (val) =>
                                setState(() => _selectedSource = val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _CustomDropdownField(
                            label: 'Type',
                            value: _selectedType,
                            options: _typeOptions,
                            onChanged: (val) =>
                                setState(() => _selectedType = val),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _CustomDropdownField(
                            label: 'Deals',
                            value: _selectedDeal,
                            options: _dealsOptions,
                            onChanged: (val) =>
                                setState(() => _selectedDeal = val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Spacing for footer
                  ],
                ),
              ),
            ),

            // Footer Actions
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.backgroundDark : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, -4),
                    blurRadius: 6,
                  ),
                ],
                border: Border(
                  top: BorderSide(
                    color: isDark ? AppTheme.slate800 : AppTheme.slate200,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: isDark ? AppTheme.slate800 : AppTheme.slate200,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: isDark ? AppTheme.slate400 : AppTheme.slate500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDark ? Colors.white : AppTheme.slate900,
                      foregroundColor:
                          isDark ? AppTheme.slate900 : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save Company',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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

class _CustomDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const _CustomDropdownField({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : AppTheme.slate900,
            ),
          ),
        ),
        Container(
          height: 44, // Align with CustomTextField
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? AppTheme.slate800 : AppTheme.slate200,
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                'Select $label',
                style: TextStyle(
                  color: isDark ? AppTheme.slate500 : AppTheme.slate400,
                  fontSize: 14,
                ),
              ),
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.slate500,
                size: 20,
              ),
              dropdownColor: isDark ? AppTheme.backgroundDark : Colors.white,
              items: options.map((String opt) {
                return DropdownMenuItem<String>(
                  value: opt,
                  child: Text(
                    opt,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white : AppTheme.slate900,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
