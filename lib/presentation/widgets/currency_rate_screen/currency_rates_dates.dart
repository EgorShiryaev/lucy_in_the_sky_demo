import 'package:flutter/material.dart';

import '../custom_app_bar_bottom.dart';
import '../grid_row.dart';

class CurrencyRatesDate extends CustomAppBarBottom {
  final List<String> dates;
  const CurrencyRatesDate({
    super.key,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBarBottom(
      child: GridRow(
        secondItem: _DateText(date: dates.first),
        thirdItem: _DateText(date: dates.last),
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
