// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perspective.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerspectiveAdapter extends TypeAdapter<Perspective> {
  @override
  final int typeId = 6;

  @override
  Perspective read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Perspective(
      text: fields[0] as String?,
      sources: (fields[1] as List?)?.cast<Source>(),
    );
  }

  @override
  void write(BinaryWriter writer, Perspective obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.sources);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerspectiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
