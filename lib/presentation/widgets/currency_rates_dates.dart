import 'package:flutter/material.dart';

import 'custom_app_bar_bottom.dart';
import 'grid_row.dart';

class CurrencyRatesDate extends CustomAppBarBottom {
  const CurrencyRatesDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBarBottom(
      child: GridRow(
        secondItem: _DateText(date: '11.11.11'),
        thirdItem: _DateText(date: '11.11.11'),
        bottomSafeArea: false,
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  final String date;
  const _DateText({required this.date});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(date, style: textTheme.titleSmall);
  }
}
