import 'package:flutter/material.dart';

import 'grid_row.dart';

class CurrencyRateView extends StatelessWidget {
  final String abbreviation;
  final int scale;
  final String name;
  final double firstPrice;
  final double secondPrice;
  const CurrencyRateView({
    super.key,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.firstPrice,
    required this.secondPrice,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GridRow(
      firstItem: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(abbreviation, style: textTheme.titleMedium),
          Text('$scale $name', style: textTheme.labelMedium),
        ],
      ),
      secondItem: _PriceText(price: firstPrice),
      thirdItem: _PriceText(price: secondPrice),
    );
  }
}

class _PriceText extends StatelessWidget {
  final double price;
  const _PriceText({required this.price});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text('$price', style: textTheme.bodyMedium);
  }
}
