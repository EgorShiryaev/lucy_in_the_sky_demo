import 'package:intl/intl.dart';

final _isoDateTimeFormat = DateFormat('yyyy-MM-ddThh:mm:ss');

DateTime convertIsoDateStringToDateTime(String str) {
  return _isoDateTimeFormat.parse(str);
}

final _isoDateFormat = DateFormat('yyyy-MM-dd');

String convertDateToIsoDate(DateTime date) {
  return _isoDateFormat.format(date);
}

final _uiDateFormat = DateFormat('dd.MM.yy');

String convertDateToUiString(DateTime date) {
  return _uiDateFormat.format(date);
}
