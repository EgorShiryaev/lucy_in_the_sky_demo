import 'package:flutter/material.dart';

import '../../domain/entities/currency.dart';

class CurrencyInfo extends StatelessWidget {
  final Currency currency;
  const CurrencyInfo({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(currency.abbreviation, style: textTheme.titleMedium),
        Text(
          '${currency.scale} ${currency.name}',
          style: textTheme.labelMedium,
        ),
      ],
    );
  }
}
