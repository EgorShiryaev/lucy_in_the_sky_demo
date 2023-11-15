import 'package:intl/intl.dart';

final _isoDateTimeFormat = DateFormat('yyyy-MM-ddThh:mm:ss');

/// Конвертирует строку iso даты и времени в DateTime 
DateTime convertIsoDateStringToDateTime(String str) {
  return _isoDateTimeFormat.parse(str);
}

final _isoDateFormat = DateFormat('yyyy-MM-dd');

/// Конвертирует DateTime в строку iso даты 
String convertDateToIsoDate(DateTime date) {
  return _isoDateFormat.format(date);
}

final _uiDateFormat = DateFormat('dd.MM.yy');

/// Конвертирует DateTime в строку для пользовательского интерфейса
String convertDateToUiString(DateTime date) {
  return _uiDateFormat.format(date);
}
