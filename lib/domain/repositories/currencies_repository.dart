import '../entities/currencies_and_rates_maps_record.dart';

/// Репозиторий валют
abstract class CurrenciesRepository {
  /// Возвращает запись с валютами и датами
  Future<CurrenciesAndRatesMapsRecord> getAll(
    DateTime date,
  );
}
