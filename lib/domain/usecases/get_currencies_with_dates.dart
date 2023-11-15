import '../entities/currencies_with_dates_record.dart';
import '../repositories/currencies_repository.dart';

/// Получение валют и датами
class GetCurrenciesWithDates {
  final CurrenciesRepository _repository;

  GetCurrenciesWithDates({
    required CurrenciesRepository repository,
  }) : _repository = repository;

  /// Возвращает запись с валютами и датами
  Future<CurrenciesWithDatesRecord> call() {
    return _repository.getCurrenciesWithDatesRecord();
  }
}
