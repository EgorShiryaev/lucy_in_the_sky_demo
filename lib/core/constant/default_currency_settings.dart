import '../../domain/entities/currency_settings.dart';

/// Настройки валют по умолчанию
final List<CurrencySettings> defaultCurrencySettings = [
  /// USD
  CurrencySettings(currencyId: 431, position: 0),

  /// EUR
  CurrencySettings(currencyId: 451, position: 1),

  /// RUB
  CurrencySettings(currencyId: 456, position: 2),
];
