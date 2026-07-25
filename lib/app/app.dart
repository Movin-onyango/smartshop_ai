import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
//import '../features/splash/presentation/pages/splash_page.dart';
import '../app/router/app_router.dart';

/// Root widget of the SmartShop AI application.
///
/// During the early development phases, the application starts
/// directly on the SplashPage. As additional features are added,
/// this will be updated to use the application's router.
class SmartShopApp extends StatelessWidget {
  const SmartShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SmartShop AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
