import 'package:hive/hive.dart';

import 'json.dart';

part 'currency_settings.g.dart';

/// Настройки валюты
@HiveType(typeId: 0)
class CurrencySettings {
  /// Id валюты
  @HiveField(0)
  final int currencyId;

  /// Отображается ли валюта
  @HiveField(1)
  bool isShowed;

  CurrencySettings({
    required this.currencyId,
    this.isShowed = true,
  });

  factory CurrencySettings.fromJsonAndPosition(Json json) {
    return CurrencySettings(currencyId: json['Cur_ID']);
  }

  Json toJson() {
    return {
      'Cur_ID': currencyId,
      'isShowed': isShowed,
    };
  }
}
