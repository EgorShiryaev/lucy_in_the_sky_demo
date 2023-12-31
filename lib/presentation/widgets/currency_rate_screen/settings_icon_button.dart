import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/currencies_cubit/currencies_cubit.dart';
import '../../bloc/currencies_cubit/currencies_states.dart';
import '../../routes/app_router.gr.dart';

class SettingsIconButton extends StatelessWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesCubit, CurrenciesState>(
      builder: (context, state) {
        if (state is CurrenciesLoadedState) {
          final currencies = state.record.currencies;
          return IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => context.router.push(
              SettingsRoute(currencies: currencies),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
