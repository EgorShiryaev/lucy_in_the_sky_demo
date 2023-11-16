import '../entities/currency.dart';

import '../repositories/currency_settings_repository.dart';

/// Сохранение настроек валют
class SaveCurrencySettings {
  final CurrencySettingsRepository _repository;

  SaveCurrencySettings({
    required CurrencySettingsRepository repository,
  }) : _repository = repository;

  /// Сохраняет настройки валют
  Future<void> call(List<Currency> currencies) async {
    final settings = currencies.map((e) => e.settings).toList();
    return _repository.save(settings);
  }
}
