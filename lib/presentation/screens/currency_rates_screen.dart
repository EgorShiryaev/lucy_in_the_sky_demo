import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.gr.dart';
import '../widgets/currency_rate_screen/currency_rates_screen_body.dart';

@RoutePage()
class CurrencyRatesScreen extends StatelessWidget {
  const CurrencyRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Курсы валют'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => context.router.push(const SettingsRoute()),
          ),
        ],
      ),
      body: const CurrencyRatesScreenBody(),
    );
  }
}
