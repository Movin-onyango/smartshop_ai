import 'app/bootstrap.dart';
import 'app/router/app_router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await bootstrap();

  MaterialApp.router(routerConfig: appRouter);
}
