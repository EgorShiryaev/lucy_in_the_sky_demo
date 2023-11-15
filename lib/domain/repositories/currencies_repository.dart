import '../entities/currencies_with_dates_record.dart';

/// Репозиторий валют
abstract class CurrenciesRepository {
  /// Выдает запись с валютами и датами
  Future<CurrenciesWithDatesRecord> getCurrenciesWithDatesRecord();
}
