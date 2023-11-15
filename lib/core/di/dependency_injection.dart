import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/datasources/currencies_datasource.dart';
import '../../data/datasources/currencies_remote_datasource.dart';
import '../../data/datasources/currency_settings_datasource.dart';
import '../../data/datasources/currency_settings_local_datasource.dart';
import '../../data/repositories/currencies_repository_impl.dart';
import '../../data/repositories/currency_settings_repository_impl.dart';
import '../../domain/entities/currency_settings.dart';
import '../../domain/repositories/currencies_repository.dart';
import '../../domain/repositories/currency_settings_repository.dart';
import '../../domain/usecases/get_currencies_with_dates.dart';
import '../../presentation/bloc/currencies_cubit.dart';
import '../constant/app_settings.dart';

final getIt = GetIt.instance;

/// Внедрение зависимостей
Future<void> dependencyInjection() async {
  await Hive.initFlutter();
  final box =
      await Hive.openBox<CurrencySettings>(AppSettings.currencySettingsBoxName);
  getIt
    ..registerFactory<CurrenciesCubit>(
      () => CurrenciesCubit(usecase: getIt()),
    )
    ..registerLazySingleton<GetCurrenciesWithDates>(
      () => GetCurrenciesWithDates(
        currenciesRepository: getIt(),
        currencySettingsRepository: getIt(),
      ),
    )
    ..registerLazySingleton<CurrenciesRepository>(
      () => CurrenciesRepositoryImpl(remoteDatasource: getIt()),
    )
    ..registerLazySingleton<CurrencySettingsRepository>(
      () => CurrencySettingsRepositoryImpl(localDatasource: getIt()),
    )
    ..registerLazySingleton<CurrenciesDatasource>(
      () => CurrenciesRemoteDatasource(dio: getIt()),
    )
    ..registerLazySingleton<CurrencySettingsDatasource>(
      () => CurrencySettingsLocalDatasource(box: getIt()),
    )
    ..registerLazySingleton<Box<CurrencySettings>>(() => box)
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: '${AppSettings.apiBaseUrl}/api',
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      ),
    );
}
