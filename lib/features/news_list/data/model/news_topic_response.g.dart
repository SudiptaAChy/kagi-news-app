// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_topic_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsTopicResponseAdapter extends TypeAdapter<NewsTopicResponse> {
  @override
  final int typeId = 0;

  @override
  NewsTopicResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsTopicResponse(
      timestamp: fields[0] as int?,
      categories: (fields[1] as List?)?.cast<NewsTopic>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsTopicResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsTopicResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
