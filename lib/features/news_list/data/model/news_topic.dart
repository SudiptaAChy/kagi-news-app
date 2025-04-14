import 'dart:convert';

class NewsTopic {
  String? name;
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
