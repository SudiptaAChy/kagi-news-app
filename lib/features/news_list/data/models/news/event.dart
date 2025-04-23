import 'dart:convert';
import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 8)
class Event extends HiveObject {
  @HiveField(0)
  String? year;

  @HiveField(1)
  String? content;

  @HiveField(2)
  double? sortYear;

  @HiveField(3)
  EventType? type;

  Event({
    this.year,
    this.content,
    this.sortYear,
    this.type,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        year: json["year"],
        content: json["content"],
        sortYear: json["sort_year"]?.toDouble(),
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "content": content,
        "sort_year": sortYear,
        "type": typeValues.reverse[type],
      };
}

@HiveType(typeId: 9)
enum EventType {
  @HiveField(0)
  event,

  @HiveField(1)
  people
}

final typeValues =
    EnumValues({"event": EventType.event, "people": EventType.people});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
