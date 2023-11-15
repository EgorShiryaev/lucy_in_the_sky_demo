import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/currency_rates_cubit.dart';
import '../../bloc/currency_rates_states.dart';
import '../failure_loading_currency_rates_view.dart';
import 'currency_rates_list_view.dart';

class CurrencyRatesScreenBody extends StatelessWidget {
  const CurrencyRatesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyRatesCubit, CurrencyRatesState>(
      builder: (context, state) {
        if (state is CurrencyRatesLoadingState ||
            state is CurrencyRatesInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrencyRatesFailureState) {
          return const FailureLoadingCurrencyRatesView();
        } else if (state is CurrencyRatesLoadedState) {
          return CurrencyRatesListView(record: state.record);
        }
        return ErrorWidget('Unknowed state of CurrencyRatesCubit');
      },
    );
  }
}
