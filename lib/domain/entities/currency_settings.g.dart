// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencySettingsAdapter extends TypeAdapter<CurrencySettings> {
  @override
  final int typeId = 0;

  @override
  CurrencySettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencySettings(
      currencyId: fields[0] as int,
      isShowed: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencySettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currencyId)
      ..writeByte(1)
      ..write(obj.isShowed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencySettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
