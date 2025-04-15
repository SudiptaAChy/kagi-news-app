import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/source.dart';

part 'perspective.g.dart';

@HiveType(typeId: 6)
class Perspective extends HiveObject {
  @HiveField(0)
  String? text;

  @HiveField(1)
  List<Source>? sources;

  Perspective({
    this.text,
    this.sources,
  });

  factory Perspective.fromRawJson(String str) => Perspective.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Perspective.fromJson(Map<String, dynamic> json) => Perspective(
    text: json["text"],
    sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
  };
}