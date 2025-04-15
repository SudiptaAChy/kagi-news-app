// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DomainAdapter extends TypeAdapter<Domain> {
  @override
  final int typeId = 5;

  @override
  Domain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Domain(
      name: fields[0] as String?,
      favicon: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Domain obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.favicon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DomainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
