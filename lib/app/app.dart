import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'router.dart';

class WeLocoApp extends StatelessWidget {
  const WeLocoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WeLoco',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}