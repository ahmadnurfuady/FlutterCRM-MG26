import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firstNameController = TextEditingController(text: 'John');
  final _lastNameController = TextEditingController(text: 'Doe');
  final _phoneController = TextEditingController(text: '+628123456789');

  // These will be read-only as per request
  final String _email = 'john.doe@siapsoft.com';
  final String _company = 'Siap Soft';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.backgroundDark : AppTheme.slate50,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: isDark ? AppTheme.backgroundDark : Colors.white,
        foregroundColor: isDark ? Colors.white : AppTheme.slate900,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Save logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully!'),
                  backgroundColor: AppTheme.emerald500,
                ),
              );
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.indigo500,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo Section (3x4 Aspect Ratio)
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isDark ? AppTheme.surfaceDark : AppTheme.slate200,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                isDark ? AppTheme.slate800 : AppTheme.slate200,
                            width: 1,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 64,
                              color: isDark
                                  ? AppTheme.slate500
                                  : AppTheme.slate400,
                            ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tap to change photo',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.slate500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Editable Fields
            CustomTextField(
              label: 'First Name',
              placeholder: 'Enter first name',
              controller: _firstNameController,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Last Name',
              placeholder: 'Enter last name',
              controller: _lastNameController,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Mobile Phone',
              placeholder: 'Enter mobile phone',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            // Read-only Fields
            CustomTextField(
              label: 'Email Address',
              placeholder: '',
              controller: TextEditingController(text: _email),
              enabled: false,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Company',
              placeholder: '',
              controller: TextEditingController(text: _company),
              enabled: false,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
