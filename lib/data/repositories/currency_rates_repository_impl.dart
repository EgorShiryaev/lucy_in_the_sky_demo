import '../../core/utils/date_utils.dart';
import '../../domain/entities/currencies_with_dates_record.dart';
import '../../domain/entities/currency.dart';
import '../../domain/entities/currency_rate.dart';
import '../../domain/entities/currency_record.dart';
import '../../domain/repositories/currency_rates_repository.dart';
import '../datasources/currencies_datasource.dart';

class CurrencyRatesRepositoryImpl implements CurrencyRatesRepository {
  final CurrenciesDatasource _remoteDatasource;

  CurrencyRatesRepositoryImpl({
    required CurrenciesDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<CurrenciesWithDatesRecord> getCurrenciesWithDatesRecord() async {
    try {
      final now = DateTime.now();
      final tomorrowDate = now.add(const Duration(days: 1));
      final yesterdayDate = now.subtract(const Duration(days: 1));
      final records = await Future.wait([
        _remoteDatasource.getAll(tomorrowDate),
        _remoteDatasource.getAll(now),
        _remoteDatasource.getAll(yesterdayDate),
      ]);
      final tommorowRecord = records.first;
      final todayRecord = records[1];
      final yesterdayRecord = records.last;

      final currenciesWithDatesRecord = tommorowRecord.isEmpty
          ? convertToCurrenciesWithDatesRecord(yesterdayRecord, todayRecord)
          : convertToCurrenciesWithDatesRecord(todayRecord, tommorowRecord);

      return currenciesWithDatesRecord;
    } catch (e) {
      rethrow;
    }
  }

  CurrenciesWithDatesRecord convertToCurrenciesWithDatesRecord(
    CurrencyRecord firstRecord,
    CurrencyRecord secondRecord,
  ) {
    final Set<int> uniqKeys = {
      ...firstRecord.currenciesMap.keys,
      ...secondRecord.currenciesMap.keys,
    };

    final List<Currency> list = [];
    final List<String> dates = [];

    for (final key in uniqKeys) {
      final currency =
          firstRecord.currenciesMap[key] ?? secondRecord.currenciesMap[key];
      final firstRate = firstRecord.ratesMap[key];
      final secondRate = secondRecord.ratesMap[key];
      final Map<String, CurrencyRate> rates = {};
      if (firstRate != null) {
        final key = convertDateToUiString(firstRate.date);
        rates[key] = firstRate;
        dates.add(key);
      }
      if (secondRate != null) {
        final key = convertDateToUiString(secondRate.date);
        rates[key] = secondRate;
        dates.add(key);
      }
      currency?.rates = rates;
      if (currency != null) {
        list.add(currency);
      }
      currency?.isShowed = true;
    }
    return (currencies: list, dates: dates);
  }
}
