import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';
import '../../../domain/entities/currency_rate.dart';
import '../currency_info.dart';
import '../grid_row.dart';

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
    if (!currency.settings.isShowed) {
      return SafeArea(
        bottom: needBottomSafeArea,
        child: const SizedBox(),
      );
    }
    return Padding(
      padding: needBottomSafeArea
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: 10),
      child: GridRow(
        needBottomSafeArea: needBottomSafeArea,
        firstItem: CurrencyInfo(currency: currency),
        secondItem: _PriceText(currencyRate: currency.rates[dates.first]),
        thirdItem: _PriceText(currencyRate: currency.rates[dates.last]),
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
