import '../../domain/entities/currency_record.dart';

abstract class CurrenciesDatasource {
  Future<CurrencyRecord> getAll(DateTime date);
}
