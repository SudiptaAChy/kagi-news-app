// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResponseAdapter extends TypeAdapter<NewsResponse> {
  @override
  final int typeId = 2;

  @override
  NewsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponse(
      category: fields[0] as String?,
      timestamp: fields[1] as int?,
      read: fields[2] as int?,
      news: (fields[3] as List?)?.cast<News>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.read)
      ..writeByte(3)
      ..write(obj.news);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
