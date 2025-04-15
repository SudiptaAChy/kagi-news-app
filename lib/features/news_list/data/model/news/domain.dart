import 'dart:convert';

import 'package:hive/hive.dart';

part 'domain.g.dart';

@HiveType(typeId: 5)
class Domain extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? favicon;

  Domain({
    this.name,
    this.favicon,
  });

  factory Domain.fromRawJson(String str) => Domain.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
    name: json["name"],
    favicon: json["favicon"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "favicon": favicon,
  };
}
