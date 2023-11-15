import 'package:hive/hive.dart';

import 'json.dart';

/// Настройки валюты
@HiveType(typeId: 0)
class CurrencySettings extends HiveObject {
  /// Id валюты
  @HiveField(0)
  final int currencyId;

  /// Отображается ли валюта
  @HiveField(1)
  bool isShowed;

  /// Позиция в списке
  @HiveField(2)
  final int position;

  CurrencySettings({
    required this.currencyId,
    required this.position,
    this.isShowed = true,
  });

  factory CurrencySettings.fromJsonAndPosition(Json json, int position) {
    return CurrencySettings(currencyId: json['Cur_ID'], position: position);
  }
}
