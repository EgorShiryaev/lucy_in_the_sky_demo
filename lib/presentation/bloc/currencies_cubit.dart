import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_currencies_with_dates.dart';
import 'currencies_states.dart';

class CurrenciesCubit extends Cubit<CurrenciesState> {
  final GetCurrenciesWithDates _usecase;
  CurrenciesCubit({
    required GetCurrenciesWithDates usecase,
  })  : _usecase = usecase,
        super(CurrenciesFailureState(message: '123'));

  /// Загружает данные
  Future<void> load() {
    emit(CurrenciesLoadingState());
    return refresh();
  }

  /// Обновляет данные
  Future<void> refresh() {
    return _usecase()
        .then((value) => emit(CurrenciesLoadedState(record: value)))
        .catchError(
          (error) => emit(CurrenciesFailureState(message: error.toString())),
        );
  }
}
