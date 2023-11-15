import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/currencies_datasource.dart';
import '../../data/datasources/currencies_remote_datasource.dart';
import '../../data/repositories/currencies_repository_impl.dart';
import '../../domain/repositories/currencies_repository.dart';
import '../../domain/usecases/get_currencies_with_dates.dart';
import '../../presentation/bloc/currencies_cubit.dart';

final getIt = GetIt.instance;

/// Внедрение зависимостей
void dependencyInjection() {
  getIt
    ..registerFactory<CurrenciesCubit>(
      () => CurrenciesCubit(usecase: getIt()),
    )
    ..registerLazySingleton<GetCurrenciesWithDates>(
      () => GetCurrenciesWithDates(repository: getIt()),
    )
    ..registerLazySingleton<CurrenciesRepository>(
      () => CurrenciesRepositoryImpl(
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
