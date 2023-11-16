import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/currencies_cubit/currencies_cubit.dart';
import '../../bloc/currencies_cubit/currencies_states.dart';
import '../failure_loading_currency_rates_view.dart';
import '../loading_view.dart';
import 'currency_rates_list_view.dart';

class CurrencyRatesScreenBody extends StatelessWidget {
  const CurrencyRatesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesCubit, CurrenciesState>(
      builder: (context, state) {
        if (state is CurrenciesLoadingState ||
            state is CurrenciesInitialState) {
          return const LoadingView();
        } else if (state is CurrenciesFailureState) {
          return FailureView(
            onPressReload: BlocProvider.of<CurrenciesCubit>(context).load,
          );
        } else if (state is CurrenciesLoadedState) {
          return CurrencyRatesListView(record: state.record);
        }
        return ErrorWidget('Unknowed state of CurrencyRatesCubit');
      },
    );
  }
}
