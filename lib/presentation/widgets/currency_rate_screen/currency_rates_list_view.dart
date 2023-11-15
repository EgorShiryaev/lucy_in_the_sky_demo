import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/currencies_with_dates_record.dart';
import '../../bloc/currency_rates_cubit.dart';
import 'currency_rate_view.dart';
import 'currency_rates_dates.dart';

class CurrencyRatesListView extends StatelessWidget {
  final CurrenciesWithDatesRecord record;
  const CurrencyRatesListView({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final dates = record.dates;
    return Column(
      children: [
        CurrencyRatesDate(dates: dates),
        Expanded(
          child: RefreshIndicator(
            onRefresh: BlocProvider.of<CurrencyRatesCubit>(context).refresh,
            child: ListView.separated(
              itemCount: record.currencies.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final currency = record.currencies[index];
                final isLast = index == record.currencies.length - 1;
                return CurrencyRateView(
                  key: ValueKey(currency.id),
                  currency: currency,
                  dates: dates,
                  needBottomSafeArea: isLast,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
