// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class RemoteDataAdapter extends TypeAdapter<RemoteData> {
  @override
  final typeId = 0;

  @override
  RemoteData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemoteData(
      fields[0] as String,
      (fields[1] as num).toInt(),
      (fields[2] as num).toInt(),
    )..buttons =
        (fields[5] as List).map((e) => (e as List).cast<ButtonData>()).toList();
  }

  @override
  void write(BinaryWriter writer, RemoteData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rows)
      ..writeByte(2)
      ..write(obj.columns)
      ..writeByte(5)
      ..write(obj.buttons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ButtonDataAdapter extends TypeAdapter<ButtonData> {
  @override
  final typeId = 1;

  @override
  ButtonData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ButtonData()
      ..icon_index = (fields[0] as num).toInt()
      ..command = (fields[5] as List).cast<int>();
  }

  @override
  void write(BinaryWriter writer, ButtonData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.icon_index)
      ..writeByte(5)
      ..write(obj.command);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
