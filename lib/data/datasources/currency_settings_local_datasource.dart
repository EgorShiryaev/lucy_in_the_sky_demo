import 'package:hive/hive.dart';

import '../../domain/entities/currency_settings.dart';
import 'currency_settings_datasource.dart';

/// Локальный источник данных настроек валют
class CurrencySettingsLocalDatasource extends CurrencySettingsDatasource {
  final Box<CurrencySettings> _box;

  CurrencySettingsLocalDatasource({
    required Box<CurrencySettings> box,
  }) : _box = box;

  @override
  Future<List<CurrencySettings>> getAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(CurrencySettings settings) {
    return _box.put(settings.position, settings);
  }
}
