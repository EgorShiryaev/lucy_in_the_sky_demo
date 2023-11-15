import 'package:flutter/material.dart';

import '../../domain/entities/currency.dart';
import '../../domain/entities/currency_rate.dart';
import 'grid_row.dart';

class CurrencyRateView extends StatelessWidget {
  final Currency currency;
  final List<String> dates;
  final bool needBottomSafeArea;
  const CurrencyRateView({
    super.key,
    required this.currency,
    required this.dates,
    this.needBottomSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GridRow(
      needBottomSafeArea: needBottomSafeArea,
      secondItem: _PriceText(currencyRate: currency.rates[dates.first]),
      thirdItem: _PriceText(currencyRate: currency.rates[dates.last]),
      firstItem: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currency.abbreviation, style: textTheme.titleMedium),
          Text(
            '${currency.scale} ${currency.name}',
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _PriceText extends StatelessWidget {
  final CurrencyRate? currencyRate;
  const _PriceText({required this.currencyRate});

  @override
  Widget build(BuildContext context) {
    final text = currencyRate?.rate.toString() ?? '';
    final textTheme = Theme.of(context).textTheme;
    return Text(text, style: textTheme.bodyMedium);
  }
}
