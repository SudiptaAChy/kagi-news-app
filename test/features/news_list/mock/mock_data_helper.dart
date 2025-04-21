import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

final mockNewsTopicResponse = NewsTopicResponse(timestamp: 100, categories: [
  NewsTopic(name: "World", file: "world.json"),
  NewsTopic(name: "Tech", file: "tech.json"),
]);

final mockNewsResponse =
    NewsResponse(category: "World", timestamp: 10, news: []);

final mockBookmarkResponse = [
  News(title: "News1"),
];
