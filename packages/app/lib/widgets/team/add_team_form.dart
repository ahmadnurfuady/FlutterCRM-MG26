import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/custom_text_field.dart';

class AddTeamForm extends StatefulWidget {
  const AddTeamForm({super.key});

  @override
  State<AddTeamForm> createState() => _AddTeamFormState();
}

class _AddTeamFormState extends State<AddTeamForm> {
  final _teamNameController = TextEditingController();
  final _memberController = TextEditingController();
  String? _nameError;

  @override
  void dispose() {
    _teamNameController.dispose();
    _memberController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _nameError =
          _teamNameController.text.isEmpty ? "Team Name is required" : null;
    });

    if (_nameError != null) return;

    // Collect data
    final data = {
      'teamName': _teamNameController.text,
      'member': _memberController.text,
    };

    debugPrint('Submitting Team: $data');
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Team saved successfully!'),
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
        height: MediaQuery.of(context).size.height *
            0.5, // Shorter since only 2 fields
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
                    'Add New Team',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppTheme.slate900,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    color: AppTheme.slate500,
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: 'Team Name',
                      placeholder: 'Enter team name',
                      controller: _teamNameController,
                      isRequired: true,
                    ),
                    if (_nameError != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        _nameError!,
                        style: const TextStyle(
                            color: AppTheme.danger, fontSize: 12),
                      ),
                    ],
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Add Team Member',
                      placeholder: 'Enter member name',
                      controller: _memberController,
                    ),
                  ],
                ),
              ),
            ),

            // Footer Actions
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
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
                      'Save',
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
