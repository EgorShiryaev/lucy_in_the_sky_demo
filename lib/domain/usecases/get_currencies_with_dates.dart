import '../../core/utils/convector.dart';
import '../entities/currencies_and_rates_maps_record.dart';
import '../entities/currencies_with_dates_record.dart';
import '../entities/currency_settings.dart';
import '../repositories/currencies_repository.dart';
import '../repositories/currency_settings_repository.dart';

/// Получение валют и датами
class GetCurrenciesWithDates {
  final CurrenciesRepository _currenciesRepository;
  final CurrencySettingsRepository _currencySettingsRepository;

  GetCurrenciesWithDates({
    required CurrenciesRepository currenciesRepository,
    required CurrencySettingsRepository currencySettingsRepository,
  })  : _currenciesRepository = currenciesRepository,
        _currencySettingsRepository = currencySettingsRepository;

  /// Возвращает запись с валютами и датами
  Future<CurrenciesWithDatesRecord> call() async {
    final now = DateTime.now();
    final tomorrowDate = now.add(const Duration(days: 1));
    final yesterdayDate = now.subtract(const Duration(days: 1));

    final results = await Future.wait([
      _currenciesRepository.getAll(yesterdayDate),
      _currenciesRepository.getAll(now),
      _currenciesRepository.getAll(tomorrowDate),
      _currencySettingsRepository.getAll(),
    ]);

    final yesterdayRecord = results[0] as CurrenciesAndRatesMapsRecord;
    final todayRecord = results[1] as CurrenciesAndRatesMapsRecord;
    final tommorowRecord = results[2] as CurrenciesAndRatesMapsRecord;
    final currencySettings = results[3] as List<CurrencySettings>;

    final records = tommorowRecord.isEmpty
        ? [yesterdayRecord, todayRecord]
        : [todayRecord, tommorowRecord];

    return ConvectorToCurrenciesWithDatesRecord(
      records: records,
      currencySettings: currencySettings,
    ).convert();
  }
}
