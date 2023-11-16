import '../../domain/entities/currency_settings.dart';
import '../../domain/repositories/currency_settings_repository.dart';
import '../datasources/currency_settings_datasource.dart';

class CurrencySettingsRepositoryImpl implements CurrencySettingsRepository {
  final CurrencySettingsDatasource _localDatasource;

  CurrencySettingsRepositoryImpl({
    required CurrencySettingsDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  @override
  Future<List<CurrencySettings>> getAll() {
    return _localDatasource.getAll();
  }

  @override
  Future<void> save(List<CurrencySettings> settings) {
    return _localDatasource.save(settings);
  }
}
