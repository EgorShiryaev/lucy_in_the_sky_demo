import 'package:flutter/material.dart';

import 'presentation/screens/currency_rates_screen.dart';
import 'presentation/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const CurrencyRatesScreen(),
    );
  }
}
