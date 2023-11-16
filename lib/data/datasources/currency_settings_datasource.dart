import '../../domain/entities/currency_settings.dart';

/// Источник данных настроек валют
abstract class CurrencySettingsDatasource {
  /// Возвращает все настроеки
  Future<List<CurrencySettings>> getAll();

  /// Сохраняет настройки
  Future<void> save(List<CurrencySettings> settings);
}
