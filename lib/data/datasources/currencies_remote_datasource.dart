import 'package:dio/dio.dart';

import '../../core/utils/date_utils.dart';
import '../../domain/entities/currency.dart';
import '../../domain/entities/currency_rate.dart';
import '../../domain/entities/currency_record.dart';
import 'currencies_datasource.dart';

const _dayRate = 0;

class CurrenciesRemoteDatasource implements CurrenciesDatasource {
  final Dio _dio;

  CurrenciesRemoteDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<CurrencyRecord> getAll(DateTime date) async {
    try {
      final isoDate = convertDateToIsoDate(date);
      final queryParams = {
        'ondate': isoDate,
        'periodicity': _dayRate,
      };
      final response = await _dio.get(
        '/exrates/rates',
        queryParameters: queryParams,
      );
      final List<dynamic> list = response.data;
      final Map<int, Currency> currenciesMap = {};
      final Map<int, CurrencyRate> ratesMap = {};

      for (final element in list) {
        final currency = Currency.fromJson(element);
        final rate = CurrencyRate.fromJson(element);
        currenciesMap[currency.id] = currency;
        ratesMap[currency.id] = rate;
      }

      return (
        isEmpty: list.isEmpty,
        currenciesMap: currenciesMap,
        ratesMap: ratesMap,
      );
    } catch (e) {
      rethrow;
    }
  }
}