import 'package:flutter/material.dart';

import '../../../domain/entities/currency.dart';
import '../currency_info.dart';
import '../custom_safe_area.dart';

class CurrencySettingsView extends StatefulWidget {
  final Currency currency;
  final bool needBottomSafeArea;
  const CurrencySettingsView({
    super.key,
    required this.currency,
    this.needBottomSafeArea = false,
  });

  @override
  State<CurrencySettingsView> createState() =>
      _CurrencySettingsViewState();
}

class _CurrencySettingsViewState extends State<CurrencySettingsView> {
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      needBottomSafeArea: widget.needBottomSafeArea,
      child: Row(
        children: [
          Expanded(
            child: CurrencyInfo(currency: widget.currency),
          ),
          Switch(
            value: widget.currency.isShowed,
            onChanged: (value) {
              widget.currency.isShowed = value;
              setState(() {});
            },
          ),
          const Icon(Icons.menu),
        ],
      ),
    );
  }
}
