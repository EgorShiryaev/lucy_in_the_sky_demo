import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency.dart';
import '../bloc/currencies_cubit/currencies_cubit.dart';
import '../bloc/currency_settings_cubit/currency_settings_cubit.dart';
import '../widgets/settings_screen/settings_screen_body.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  final List<Currency> currencies;
  const SettingsScreen({super.key, required this.currencies});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        unawaited(BlocProvider.of<CurrenciesCubit>(context).load());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Настройка валют'),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<CurrencySettingsCubit>(context)
                    .save(currencies);
              },
              icon: const Icon(Icons.check_rounded),
            ),
          ],
        ),
        body: SettingsScreenBody(currencies: currencies),
      ),
    );
  }
}
