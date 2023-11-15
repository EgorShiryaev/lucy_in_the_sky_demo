import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/currencies_datasource.dart';
import '../../data/datasources/currencies_remote_datasource.dart';
import '../../data/repositories/currency_rates_repository_impl.dart';
import '../../domain/repositories/currency_rates_repository.dart';
import '../../domain/usecases/get_currency_rates_with_dates_record.dart';
import '../../presentation/bloc/currency_rates_cubit.dart';

final getIt = GetIt.instance;

void dependencyInjection() {
  getIt
    ..registerFactory<CurrencyRatesCubit>(
      () => CurrencyRatesCubit(usecase: getIt()),
    )
    ..registerLazySingleton<GetCurrencyRatesWithDatesRecord>(
      () => GetCurrencyRatesWithDatesRecord(repository: getIt()),
    )
    ..registerLazySingleton<CurrencyRatesRepository>(
      () => CurrencyRatesRepositoryImpl(
        remoteDatasource: getIt(),
      ),
    )
    ..registerLazySingleton<CurrenciesDatasource>(
      () => CurrenciesRemoteDatasource(dio: getIt()),
    )
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://www.nbrb.by/api',
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      ),
    );
}
