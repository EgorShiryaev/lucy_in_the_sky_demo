import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency_rates_cubit.dart';

class FailureLoadingCurrencyRatesView extends StatelessWidget {
  const FailureLoadingCurrencyRatesView({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
