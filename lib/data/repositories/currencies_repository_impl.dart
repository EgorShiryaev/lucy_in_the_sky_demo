import '../../domain/entities/currencies_and_rates_maps_record.dart';
import '../../domain/repositories/currencies_repository.dart';
import '../datasources/currencies_datasource.dart';

/// Репозиторий валют
class CurrenciesRepositoryImpl implements CurrenciesRepository {
  final CurrenciesDatasource _remoteDatasource;

  CurrenciesRepositoryImpl({
    required CurrenciesDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<CurrenciesAndRatesMapsRecord> getAll(DateTime date) {
    return _remoteDatasource.getAll(date);
  }
}
