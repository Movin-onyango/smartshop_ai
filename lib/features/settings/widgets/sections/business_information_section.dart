import 'package:flutter/material.dart';

import '../../controllers/business_settings_controller.dart';

import '../tiles/settings_section_header.dart';
import '../tiles/settings_text_tile.dart';

/// ---------------------------------------------------------------------------
/// BusinessInformationSection
/// ---------------------------------------------------------------------------
///
/// Displays editable business profile information.
///
/// Used by:
/// • BusinessSettingsScreen
/// ---------------------------------------------------------------------------
class BusinessInformationSection extends StatelessWidget {
  const BusinessInformationSection({
    super.key,
    required this.controller,
  });

  final BusinessSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Business Information',
          subtitle: 'Manage your business profile.',
        ),

        SettingsTextTile(
          title: 'Business Name',
          value: controller.businessName,
          leading: Icons.business,
          onTap: controller.editBusinessName,
        ),

        SettingsTextTile(
          title: 'Owner Name',
          value: controller.ownerName,
          leading: Icons.person,
          onTap: controller.editOwnerName,
        ),

        SettingsTextTile(
          title: 'Phone Number',
          value: controller.phone,
          leading: Icons.phone,
          onTap: controller.editPhone,
        ),

        SettingsTextTile(
          title: 'Email Address',
          value: controller.email,
          leading: Icons.email,
          onTap: controller.editEmail,
        ),

        SettingsTextTile(
          title: 'Business Address',
          value: controller.address,
          leading: Icons.location_on,
          maxLines: 2,
          onTap: controller.editAddress,
        ),

        SettingsTextTile(
          title: 'Tax PIN',
          value: controller.taxPin,
          leading: Icons.badge,
          onTap: controller.editTaxPin,
        ),
      ],
    );
  }
}