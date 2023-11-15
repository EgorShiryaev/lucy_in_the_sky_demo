import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/currency_rates_cubit.dart';
import '../../bloc/currency_rates_states.dart';
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Не удалось получить курсы валют'),
                const SizedBox(height: 16),
                IconButton(
                  onPressed: BlocProvider.of<CurrencyRatesCubit>(context).load,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          );
        } else if (state is CurrencyRatesLoadedState) {
          return CurrencyRatesListView(record: state.record);
        }
        return ErrorWidget('Unknowed state of CurrencyRatesCubit');
      },
    );
  }
}
