import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

abstract class NewsRepository {
  Future<NewsTopicResponse?> fetchNewsTopic();
  Future<NewsResponse?> fetchNews(String file);
}
