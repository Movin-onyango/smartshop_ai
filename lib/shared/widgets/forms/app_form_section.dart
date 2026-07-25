import 'package:flutter/material.dart';

import 'app_form_card.dart';
import 'app_section_title.dart';

/// ---------------------------------------------------------------------------
/// AppFormSection
/// ---------------------------------------------------------------------------
///
/// A reusable form section consisting of:
///
/// • AppFormCard
/// • AppSectionTitle
/// • Standard spacing
/// • Section content
///
/// This widget eliminates repetitive layout code across all forms.
///
/// Used by:
/// • Product Form
/// • Supplier Form
/// • Customer Form
/// • Sales Form
/// • Expenses Form
/// • Settings
/// ---------------------------------------------------------------------------
class AppFormSection extends StatelessWidget {
  const AppFormSection({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.trailing,
    this.padding = const EdgeInsets.all(24),
    this.contentSpacing = 24,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double contentSpacing;

  @override
  Widget build(BuildContext context) {
    return AppFormCard(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionTitle(title: title, subtitle: subtitle, trailing: trailing),

          SizedBox(height: contentSpacing),

          child,
        ],
      ),
    );
  }
}
