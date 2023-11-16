import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/currency.dart';

import '../../../domain/usecases/save_currency_settings.dart';
import 'currency_settings_states.dart';

class CurrencySettingsCubit extends Cubit<CurrencySettingsState> {
  final SaveCurrencySettings _usecase;
  CurrencySettingsCubit({
    required SaveCurrencySettings usecase,
  })  : _usecase = usecase,
        super(CurrencySettingsInitialState());

  /// Сохраняет данные
  Future<void> save(List<Currency> currencies) {
    emit(CurrencySettingsLoadingState());
    return _usecase(currencies)
        .then((value) => emit(CurrencySettingsSuccessState()))
        .catchError((error) {
      emit(CurrencySettingsFailureState(error: error));
    });
  }
}
