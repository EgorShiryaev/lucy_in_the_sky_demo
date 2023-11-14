import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.gr.dart';
import '../widgets/currency_rate_view.dart';
import '../widgets/currency_rates_dates.dart';

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
      body: Column(
        children: [
          const CurrencyRatesDate(),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const CurrencyRateView(
                  abbreviation: 'USD',
                  scale: 1,
                  name: 'Доллар США',
                  firstPrice: 1.92,
                  secondPrice: 1.93,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
