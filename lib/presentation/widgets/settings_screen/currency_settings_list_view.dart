import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';
import 'currency_settings_view.dart';

class CurrencySettingsListView extends StatefulWidget {
  final List<Currency> currencies;
  const CurrencySettingsListView({super.key, required this.currencies});

  @override
  State<CurrencySettingsListView> createState() =>
      _CurrencySettingsListViewState();
}

class _CurrencySettingsListViewState extends State<CurrencySettingsListView> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: widget.currencies.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) {
          // тк при перемешении на позицию выдает index+1
          newIndex--;
        }
        final currencies = widget.currencies;
        final tmp = currencies[oldIndex];
        currencies
          ..removeAt(oldIndex)
          ..insert(newIndex, tmp);
        setState(() {});
      },
      itemBuilder: (context, index) {
        final currency = widget.currencies[index];
        final isLast = index == widget.currencies.length - 1;
        return CurrencySettingsView(
          key: ValueKey(currency.id),
          currency: currency,
          needBottomSafeArea: isLast,
        );
      },
    );
  }
}
