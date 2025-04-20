import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/event.dart';
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

  @HiveField(4)
  List<Event>? events;

  NewsResponse({
    this.category,
    this.timestamp,
    this.read,
    this.news,
    this.events,
  });

  factory NewsResponse.fromRawJson(String str) =>
      NewsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        category: json["category"],
        timestamp: json["timestamp"],
        read: json["read"],
        news: json["clusters"] == null
            ? []
            : List<News>.from(json["clusters"]!.map((x) => News.fromJson(x))),
        events: json["events"] == null
            ? []
            : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "timestamp": timestamp,
        "read": read,
        "clusters": news == null
            ? []
            : List<dynamic>.from(news!.map((x) => x.toJson())),
        "events": events == null
            ? []
            : List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}
