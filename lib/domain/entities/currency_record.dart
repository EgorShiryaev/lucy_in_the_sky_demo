import 'currency.dart';
import 'currency_rate.dart';

typedef CurrencyRecord = ({
  bool isEmpty,
  Map<int, Currency> currenciesMap,
  Map<int, CurrencyRate> ratesMap,
});
