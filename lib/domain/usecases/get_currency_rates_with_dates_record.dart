import '../entities/currencies_with_dates_record.dart';
import '../repositories/currency_rates_repository.dart';

class GetCurrencyRatesWithDatesRecord {
  final CurrencyRatesRepository _repository;

  GetCurrencyRatesWithDatesRecord({
    required CurrencyRatesRepository repository,
  }) : _repository = repository;

  Future<CurrenciesWithDatesRecord> call() {
    return _repository.getCurrenciesWithDatesRecord();
  }
}
