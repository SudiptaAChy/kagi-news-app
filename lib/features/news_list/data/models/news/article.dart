import 'dart:convert';

import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 4)
class Article extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? link;

  @HiveField(2)
  String? domain;

  @HiveField(3)
  DateTime? date;

  @HiveField(4)
  String? image;

  @HiveField(5)
  String? imageCaption;

  Article({
    this.title,
    this.link,
    this.domain,
    this.date,
    this.image,
    this.imageCaption,
  });

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    title: json["title"],
    link: json["link"],
    domain: json["domain"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    image: json["image"],
    imageCaption: json["image_caption"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
    "domain": domain,
    "date": date?.toIso8601String(),
    "image": image,
    "image_caption": imageCaption,
  };
}
