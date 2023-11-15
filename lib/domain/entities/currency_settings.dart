/// Настройки валюты
class CurrencySettings {
  /// Id валюты
  final int id;

  /// Отображается ли валюта
  final String isShowed;

  /// Позиция в списке
  final int position;

  CurrencySettings({
    required this.id,
    required this.isShowed,
    required this.position,
  });
}
