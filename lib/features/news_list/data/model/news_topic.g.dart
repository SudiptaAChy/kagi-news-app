// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_topic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsTopicAdapter extends TypeAdapter<NewsTopic> {
  @override
  final int typeId = 1;

  @override
  NewsTopic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsTopic(
      name: fields[0] as String?,
      file: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsTopic obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsTopicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
