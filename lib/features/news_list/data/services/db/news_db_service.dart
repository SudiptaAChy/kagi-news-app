import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

abstract class NewsDbService {
  NewsTopicResponse? getNewsTopics();
  Future<void> saveNewsTopics(NewsTopicResponse data);
  NewsResponse? getNews(String file);
  Future<void> saveNews(NewsResponse data, String file);
}
