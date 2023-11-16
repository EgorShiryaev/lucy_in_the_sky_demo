/// Cостояние
abstract class CurrencySettingsState {}

/// Изначальное состояние
class CurrencySettingsInitialState extends CurrencySettingsState {}

/// Состояние загрузки
class CurrencySettingsLoadingState extends CurrencySettingsState {}

/// Удачное состояние
class CurrencySettingsSuccessState extends CurrencySettingsState {}

/// Ошибочное состояние
class CurrencySettingsFailureState extends CurrencySettingsState {
  final Error error;

  CurrencySettingsFailureState({required this.error});
}
