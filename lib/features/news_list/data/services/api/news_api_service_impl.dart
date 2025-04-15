import 'package:kagi_news_app/core/network/api_response.dart';
import 'package:kagi_news_app/core/network/api_router.dart';
import 'package:kagi_news_app/core/network/network_service.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news_response.dart';

import 'package:kagi_news_app/features/news_list/data/model/news_topic/news_topic_response.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service.dart';

class NewsApiServiceImpl implements NewsApiService {
  final _networkService = NetworkService.instance;

  @override
  Future<ApiResponse<NewsTopicResponse?>> fetchNewsTopic() async {
    final response = await _networkService.request(
      ApiRouter.newsTopics,
      parser: (data) => NewsTopicResponse.fromJson(data),
    );
    return response;
  }

  @override
  Future<ApiResponse<NewsResponse?>> fetchNews(String file) async {
    final response = await _networkService.request(
        file,
        parser: (data) => NewsResponse.fromJson(data),
    );
    return response;
  }
}
