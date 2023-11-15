import '../entities/currency_settings.dart';

/// Репозиторий настроек валют
abstract class CurrencySettingsRepository {
  /// Возвращает настройки валют
  Future<List<CurrencySettings>> getAll();
  /// Сохраняет настройки
  Future<void> save(CurrencySettings settings);
}
