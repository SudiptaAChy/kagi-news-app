import 'package:kagi_news_app/core/network/api_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

abstract class NewsApiService {
  Future<ApiResponse<NewsTopicResponse?>> fetchNewsTopic();
  Future<ApiResponse<NewsResponse?>> fetchNews(String file);
}
