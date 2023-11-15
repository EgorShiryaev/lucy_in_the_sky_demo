import '../../domain/entities/currencies_and_rates_maps_record.dart';
import '../../domain/entities/currencies_with_dates_record.dart';
import '../../domain/entities/currency.dart';
import '../../domain/entities/currency_rate.dart';
import '../../domain/entities/currency_settings.dart';
import '../constant/default_currency_settings.dart';
import 'date_utils.dart';

typedef RatesMap = Map<String, CurrencyRate>;

class ConvectorToCurrenciesWithDatesRecord {
  final List<CurrenciesAndRatesMapsRecord> _records;
  final List<CurrencySettings> _currencySettings;

  ConvectorToCurrenciesWithDatesRecord({
    required List<CurrenciesAndRatesMapsRecord> records,
    required List<CurrencySettings> currencySettings,
  })  : _records = records,
        _currencySettings = currencySettings.isNotEmpty
            ? currencySettings
            : defaultCurrencySettings;

  CurrenciesWithDatesRecord convert() {
    final List<Currency> currencies = [];
    final uniqKeys = _records.expand((e) => e.currenciesMap.keys).toSet();

    for (final settings in _currencySettings) {
      if (!settings.isShowed) {
        uniqKeys.remove(settings.currencyId);
        continue;
      }
      final currency = _getCurrency(settings.currencyId);
      if (currency != null) {
        currency.settings = settings;
        currencies.add(currency);
        uniqKeys.remove(currency.id);
      }
    }

    for (final key in uniqKeys) {
      final currency = _getCurrency(key);
      if (currency != null) {
        currencies.add(currency);
        currency.settings = CurrencySettings(
          currencyId: currency.id,
          position: currencies.length,
        );
      }
    }

    final List<String> dates = [];

    if (currencies.isNotEmpty) {
      dates.addAll(_getDates(currencies.first));
    }

    return (currencies: currencies, dates: dates);
  }

  Currency? _getCurrency(int currencyId) {
    final currency = _records
        .firstWhere((element) => element.currenciesMap[currencyId] != null)
        .currenciesMap[currencyId];

    if (currency == null) {
      return null;
    }

    final rates = _records
        .map((e) => e.ratesMap[currencyId])
        .where((element) => element != null);

    final RatesMap ratesMap = {};
    for (final element in rates) {
      final key = convertDateToUiString(element!.date);
      ratesMap[key] = element;
    }
    currency.rates = ratesMap;
    return currency;
  }

  List<String> _getDates(Currency currency) {
    return currency.rates.keys.toList();
  }
}
