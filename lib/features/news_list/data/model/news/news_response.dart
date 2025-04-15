import 'dart:convert';

import 'package:hive/hive.dart';
import './news.dart';

part 'news_response.g.dart';

@HiveType(typeId: 2)
class NewsResponse extends HiveObject {
  @HiveField(0)
  String? category;

  @HiveField(1)
  int? timestamp;

  @HiveField(2)
  int? read;

  @HiveField(3)
  List<News>? news;

  NewsResponse({
    this.category,
    this.timestamp,
    this.read,
    this.news,
  });

  factory NewsResponse.fromRawJson(String str) => NewsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    category: json["category"],
    timestamp: json["timestamp"],
    read: json["read"],
    news: json["clusters"] == null ? [] : List<News>.from(json["clusters"]!.map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "timestamp": timestamp,
    "read": read,
    "clusters": news == null ? [] : List<dynamic>.from(news!.map((x) => x.toJson())),
  };
}
