import 'dart:convert';

class NewsCategory {
  String? name;
  String? file;

  NewsCategory({
    this.name,
    this.file,
  });

  factory NewsCategory.fromRawJson(String str) =>
      NewsCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
        name: json["name"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "file": file,
      };
}
