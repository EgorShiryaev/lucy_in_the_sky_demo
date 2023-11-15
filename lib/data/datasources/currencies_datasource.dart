import '../../domain/entities/currency_record.dart';

/// Источник данных валют
abstract class CurrenciesDatasource {
  /// Возвращает все валюты и их стоимости
  Future<CurrencyRecord> getAll(DateTime date);
}
