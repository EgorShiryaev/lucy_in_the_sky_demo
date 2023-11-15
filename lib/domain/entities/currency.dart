import 'currency_rate.dart';

/// Валюта
class Currency {
  /// Id валюты
  final int id;

  /// Буквенный код
  final String abbreviation;

  /// Количество единиц иностранной валюты
  final int scale;

  /// Наименование валюты на русском языке во множественном, либо в единственном
  /// числе, в зависимости от количества единиц
  final String name;

  /// Курс валюты за определенные дни
  late final Map<String, CurrencyRate> rates;

  /// Отображается ли валюта
  late bool isShowed;

  Currency({
    required this.id,
    required this.abbreviation,
    required this.scale,
    required this.name,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['Cur_ID'],
      abbreviation: json['Cur_Abbreviation'],
      scale: json['Cur_Scale'],
      name: json['Cur_Name'],
    );
  }
}
