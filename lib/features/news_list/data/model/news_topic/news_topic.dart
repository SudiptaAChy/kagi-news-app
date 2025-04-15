import 'dart:convert';

import 'package:hive/hive.dart';

part 'news_topic.g.dart';

@HiveType(typeId: 1)
class NewsTopic extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? file;

  NewsTopic({
    this.name,
    this.file,
  });

  factory NewsTopic.fromRawJson(String str) =>
      NewsTopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsTopic.fromJson(Map<String, dynamic> json) => NewsTopic(
        name: json["name"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "file": file,
      };
}
