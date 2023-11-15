import 'package:hive/hive.dart';

/// Настройки валюты
@HiveType(typeId: 0)
class CurrencySettings extends HiveObject {
  /// Id валюты
  @HiveField(0)
  final int currencyId;

  /// Отображается ли валюта
  @HiveField(1)
  final String isShowed;

  /// Позиция в списке
  @HiveField(2)
  final int position;

  CurrencySettings({
    required this.currencyId,
    required this.isShowed,
    required this.position,
  });
}
