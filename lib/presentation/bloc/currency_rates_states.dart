import '../../domain/entities/currencies_with_dates_record.dart';

abstract class CurrencyRatesState {}

class CurrencyRatesInitialState extends CurrencyRatesState {}

class CurrencyRatesLoadingState extends CurrencyRatesState {}

class CurrencyRatesLoadedState extends CurrencyRatesState {
  final CurrenciesWithDatesRecord record;

  CurrencyRatesLoadedState({required this.record});
}

class CurrencyRatesFailureState extends CurrencyRatesState {
  final String message;

  CurrencyRatesFailureState({required this.message});
}
