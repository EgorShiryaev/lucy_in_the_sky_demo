import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency.dart';
import '../bloc/currencies_cubit.dart';
import '../widgets/custom_app_bar_bottom.dart';
import '../widgets/settings_screen/currency_settings_list_view.dart';

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
                context.router.pop();
              },
              icon: const Icon(Icons.check_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            const CustomAppBarBottom(),
            Expanded(
              child: CurrencySettingsListView(currencies: currencies),
            ),
          ],
        ),
      ),
    );
  }
}
