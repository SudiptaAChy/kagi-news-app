import 'dart:convert';

import 'package:kagi_news_app/features/news_list/data/model/news_category.dart';

class NewsCategoryResponse {
  int? timestamp;
  List<NewsCategory>? categories;

  NewsCategoryResponse({
    this.timestamp,
    this.categories,
  });

  factory NewsCategoryResponse.fromRawJson(String str) =>
      NewsCategoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      NewsCategoryResponse(
        timestamp: json["timestamp"],
        categories: json["categories"] == null
            ? []
            : List<NewsCategory>.from(
                json["categories"]!.map((x) => NewsCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}
