import 'package:flutter/material.dart';

import '../../controllers/security_settings_controller.dart';

import '../tiles/settings_action_tile.dart';
import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';

/// ---------------------------------------------------------------------------
/// SecuritySection
/// ---------------------------------------------------------------------------
///
/// Displays application security configuration.
///
/// Used by:
/// • SecuritySettingsScreen
/// ---------------------------------------------------------------------------
class SecuritySection extends StatelessWidget {
  const SecuritySection({
    super.key,
    required this.controller,
  });

  final SecuritySettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Security Settings',
          subtitle: 'Protect your application and business data.',
        ),

        SettingsSwitchTile(
          title: 'Enable PIN Lock',
          subtitle: 'Require a PIN when opening the application.',
          leading: Icons.lock,
          value: controller.pinEnabled,
          onChanged: controller.setPinEnabled,
        ),

        SettingsSwitchTile(
          title: 'Enable Biometric Login',
          subtitle: 'Allow fingerprint or face authentication.',
          leading: Icons.fingerprint,
          value: controller.biometricEnabled,
          onChanged: controller.setBiometricEnabled,
        ),

        SettingsSwitchTile(
          title: 'Require Login on Launch',
          subtitle: 'Require authentication every time the app starts.',
          leading: Icons.login,
          value: controller.requireLoginOnLaunch,
          onChanged: controller.setRequireLoginOnLaunch,
        ),

        SettingsDropdownTile<int>(
          title: 'Auto Lock Timeout',
          leading: Icons.timer,
          value: controller.autoLockMinutes,
          items: controller.availableTimeouts
              .map(
                (minutes) => DropdownMenuItem<int>(
                  value: minutes,
                  child: Text('$minutes minutes'),
                ),
              )
              .toList(),
          onChanged: controller.setAutoLockMinutes,
        ),

        SettingsDropdownTile<int>(
          title: 'Session Timeout',
          leading: Icons.schedule,
          value: controller.sessionTimeoutMinutes,
          items: controller.availableTimeouts
              .map(
                (minutes) => DropdownMenuItem<int>(
                  value: minutes,
                  child: Text('$minutes minutes'),
                ),
              )
              .toList(),
          onChanged: controller.setSessionTimeoutMinutes,
        ),

        SettingsSwitchTile(
          title: 'Allow Password Reset',
          subtitle: 'Permit password reset when authentication is required.',
          leading: Icons.password,
          value: controller.allowPasswordReset,
          onChanged: controller.setAllowPasswordReset,
        ),

        SettingsSwitchTile(
          title: 'Enable Audit Log',
          subtitle: 'Record important security events.',
          leading: Icons.history,
          value: controller.enableAuditLog,
          onChanged: controller.setEnableAuditLog,
        ),

        SettingsActionTile(
          title: 'Change PIN',
          subtitle: 'Update your application PIN.',
          leading: Icons.password,
          onTap: controller.changePin,
        ),

        SettingsActionTile(
          title: 'Reset Security Settings',
          subtitle: 'Restore default security configuration.',
          leading: Icons.restart_alt,
          textColor: Colors.red,
          onTap: controller.resetSecuritySettings,
        ),
      ],
    );
  }
}