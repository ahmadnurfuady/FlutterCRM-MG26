import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool readOnly;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.readOnly = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text.rich(
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : AppTheme.slate900,
              ),
              children: isRequired
                  ? [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: AppTheme.danger),
                      ),
                    ]
                  : [],
            ),
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          enabled: enabled,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white : AppTheme.slate900,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: isDark ? AppTheme.slate500 : AppTheme.slate400,
              fontSize: 14,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            filled: true,
            fillColor: !enabled
                ? (isDark
                    ? AppTheme.slate800.withValues(alpha: 0.5)
                    : AppTheme.slate50)
                : (isDark ? AppTheme.surfaceDark : Colors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? AppTheme.slate800 : AppTheme.slate200,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.danger,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
