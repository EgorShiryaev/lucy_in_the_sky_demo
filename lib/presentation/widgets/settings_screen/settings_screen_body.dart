import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/currency.dart';
import '../../bloc/currency_settings_cubit/currency_settings_cubit.dart';
import '../../bloc/currency_settings_cubit/currency_settings_states.dart';
import '../custom_app_bar_bottom.dart';
import '../failure_loading_currency_rates_view.dart';
import '../loading_view.dart';
import 'currency_settings_list_view.dart';

class SettingsScreenBody extends StatelessWidget {
  final List<Currency> currencies;
  const SettingsScreenBody({super.key, required this.currencies});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencySettingsCubit, CurrencySettingsState>(
      listener: (context, state) {
        if (state is CurrencySettingsSuccessState) {
          context.router.pop();
        }
      },
      builder: (context, state) {
        if (state is CurrencySettingsLoadingState) {
          return const LoadingView();
        } else if (state is CurrencySettingsFailureState) {
          return FailureView(
            message: 'Не удалось сохранить настройки. Повторите попытку',
            onPressReload: () {
              BlocProvider.of<CurrencySettingsCubit>(context).save(currencies);
            },
          );
        }
        return Column(
          children: [
            const CustomAppBarBottom(),
            Expanded(
              child: CurrencySettingsListView(currencies: currencies),
            ),
          ],
        );
      },
    );
  }
}
