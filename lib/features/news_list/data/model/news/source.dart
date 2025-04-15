import 'dart:convert';

import 'package:hive/hive.dart';

part 'source.g.dart';

@HiveType(typeId: 7)
class Source extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  Source({
    this.name,
    this.url,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
