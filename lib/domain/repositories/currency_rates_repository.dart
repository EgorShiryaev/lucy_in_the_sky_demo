import '../entities/currencies_with_dates_record.dart';

abstract class CurrencyRatesRepository {
  Future<CurrenciesWithDatesRecord> getCurrenciesWithDatesRecord();
}
