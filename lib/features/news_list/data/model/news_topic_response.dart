import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic.dart';

part 'news_topic_response.g.dart';

@HiveType(typeId: 0)
class NewsTopicResponse extends HiveObject {
  @HiveField(0)
  int? timestamp;

  @HiveField(1)
  List<NewsTopic>? categories;

  NewsTopicResponse({
    this.timestamp,
    this.categories,
  });

  factory NewsTopicResponse.fromRawJson(String str) =>
      NewsTopicResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsTopicResponse.fromJson(Map<String, dynamic> json) =>
      NewsTopicResponse(
        timestamp: json["timestamp"],
        categories: json["categories"] == null
            ? []
            : List<NewsTopic>.from(
                json["categories"]!.map((x) => NewsTopic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}
