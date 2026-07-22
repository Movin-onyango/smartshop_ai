import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/app_routes.dart';
import '../widgets/splash_header.dart';

import  '/../../shared/widgets/layouts/smart_scaffold.dart';


/// Splash screen displayed when SmartShop AI launches.
///
/// Responsibilities:
/// - Display branding
/// - Perform lightweight startup initialization
/// - Navigate to the Login screen
///
/// Heavy initialization (database, authentication, syncing, AI models)
/// will be added later through dedicated services.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _startupTimer;

  @override
  void initState() {
    super.initState();
    _startInitialization();
  }

  void _startInitialization() {
    _startupTimer = Timer(
      const Duration(seconds: 2),
      () {
        if (!mounted) return;

        context.go(AppRoutes.dashboard);
      },
    );
  }

  @override
  void dispose() {
    _startupTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SmartScaffold(
            title: 'Splash ',

      body: SafeArea(
        child: SplashHeader(),
      ),
    );
  }
}