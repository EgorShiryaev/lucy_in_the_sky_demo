import 'currency.dart';
import 'currency_rate.dart';

typedef CurrenciesAndRatesMapsRecord = ({
  bool isEmpty,
  Map<int, Currency> currenciesMap,
  Map<int, CurrencyRate> ratesMap,
});
