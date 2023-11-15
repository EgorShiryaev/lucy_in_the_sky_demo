import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_currency_rates_with_dates_record.dart';
import 'currency_rates_states.dart';

class CurrencyRatesCubit extends Cubit<CurrencyRatesState> {
  final GetCurrencyRatesWithDatesRecord _usecase;
  CurrencyRatesCubit({
    required GetCurrencyRatesWithDatesRecord usecase,
  })  : _usecase = usecase,
        super(CurrencyRatesFailureState(message: '123'));

  /*
  * Загрузка данных
  */
  Future<void> load() {
    emit(CurrencyRatesLoadingState());
    return refresh();
  }

  /*
  * Обновление данных
  */
  Future<void> refresh() {
    return _usecase()
        .then((value) => emit(CurrencyRatesLoadedState(record: value)))
        .catchError(
          (error) => emit(CurrencyRatesFailureState(message: error.toString())),
        );
  }
}
