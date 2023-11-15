import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/currency_rate_screen/currency_rates_screen_body.dart';
import '../widgets/currency_rate_screen/settings_icon_button.dart';

@RoutePage()
class CurrencyRatesScreen extends StatelessWidget {
  const CurrencyRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Курсы валют'),
        actions: const [SettingsIconButton()],
      ),
      body: const CurrencyRatesScreenBody(),
    );
  }
}
