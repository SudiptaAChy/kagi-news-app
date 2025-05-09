import 'package:hive/hive.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';

import '../../features/news_list/data/models/news_topic/news_topic_response.dart';

class HiveBoxes {
  HiveBoxes._();

  static late Box<NewsTopicResponse> newsTopic;
  static late Box<NewsResponse> news;
  static late Box<News> bookmarks;

  static Future<void> init() async {
    newsTopic = await Hive.openBox<NewsTopicResponse>("news_topics");
    news = await Hive.openBox<NewsResponse>("news");
    bookmarks = await Hive.openBox<News>("bookmarks");
  }
}
