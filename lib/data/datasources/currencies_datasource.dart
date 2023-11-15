import '../../domain/entities/currencies_and_rates_maps_record.dart';

/// Источник данных валют
abstract class CurrenciesDatasource {
  /// Возвращает все валюты и их стоимости
  Future<CurrenciesAndRatesMapsRecord> getAll(DateTime date);
}
