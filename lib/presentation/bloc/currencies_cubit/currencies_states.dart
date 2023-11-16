import '../../../domain/entities/currencies_with_dates_record.dart';

/// Cостояние
abstract class CurrenciesState {}

/// Изначальное состояние
class CurrenciesInitialState extends CurrenciesState {}

/// Состояние загрузки
class CurrenciesLoadingState extends CurrenciesState {}

/// Данные загружены
class CurrenciesLoadedState extends CurrenciesState {
  final CurrenciesWithDatesRecord record;

  CurrenciesLoadedState({required this.record});
}

/// Ошибочное состояние
class CurrenciesFailureState extends CurrenciesState {}
