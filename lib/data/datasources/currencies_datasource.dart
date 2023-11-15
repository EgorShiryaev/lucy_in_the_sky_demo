import '../../domain/entities/currency_record.dart';

/// Источник данных валют
abstract class CurrenciesDatasource {
  /// Выдает все валюты и их стоимости
  Future<CurrencyRecord> getAll(DateTime date);
}
