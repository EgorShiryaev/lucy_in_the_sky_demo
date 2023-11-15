import '../../domain/entities/currencies_with_dates_record.dart';

/// Cостояние
abstract class CurrenciesState {}

class CurrenciesInitialState extends CurrenciesState {}

class CurrenciesLoadingState extends CurrenciesState {}

class CurrenciesLoadedState extends CurrenciesState {
  final CurrenciesWithDatesRecord record;

  CurrenciesLoadedState({required this.record});
}

class CurrenciesFailureState extends CurrenciesState {
  final String message;

  CurrenciesFailureState({required this.message});
}
