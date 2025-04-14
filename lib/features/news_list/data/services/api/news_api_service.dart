import 'package:kagi_news_app/core/network/api_response.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic_response.dart';

abstract class NewsApiService {
  Future<ApiResponse<NewsTopicResponse?>> fetchNewsTopic();
}
