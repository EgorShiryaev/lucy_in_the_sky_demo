import '../../domain/entities/currency_settings.dart';

/// Настройки валют по умолчанию
final List<CurrencySettings> defaultCurrencySettings = [
  /// USD
  CurrencySettings(currencyId: 431),

  /// EUR
  CurrencySettings(currencyId: 451),

  /// RUB
  CurrencySettings(currencyId: 456),
];
