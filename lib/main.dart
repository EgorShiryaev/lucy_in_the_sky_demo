import 'package:flutter/material.dart';

import 'presentation/routes/app_router.dart';
import 'presentation/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: appRouter.config(),
    );
  }
}
