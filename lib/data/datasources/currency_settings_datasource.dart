import '../../domain/entities/currency_settings.dart';

/// Источник данных настроек валют
abstract class CurrencySettingsDatasource {
  /// Выдает все настроеки
  List<CurrencySettings> getAll();

  /// Сохраняет настройки
  Future<void> save(CurrencySettings settings);
}
