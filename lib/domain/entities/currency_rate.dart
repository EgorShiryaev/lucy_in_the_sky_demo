import '../../core/utils/date_utils.dart';

/// Курс валюты
class CurrencyRate {
  /// Дата
  final DateTime date;

  /// Курс валюты
  final double rate;

  CurrencyRate({
    required this.date,
    required this.rate,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) {
    return CurrencyRate(
      date: convertIsoDateStringToDateTime(json['Date']),
      rate: json['Cur_OfficialRate'],
    );
  }
}
