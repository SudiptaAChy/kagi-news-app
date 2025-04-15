import 'package:kagi_news_app/features/news_list/data/model/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic/news_topic_response.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _apiService;
  final NewsDbService _dbService;

  NewsRepositoryImpl(this._apiService, this._dbService);

  @override
  Future<NewsTopicResponse?> fetchNewsTopic() async {
    final apiResponse = await _apiService.fetchNewsTopic();

    if (apiResponse.error != null) {
      return _dbService.getNewsTopics();
    }

    if (apiResponse.data != null) {
      await _dbService.saveNewsTopics(apiResponse.data!);
    }

    return apiResponse.data;
  }

  @override
  Future<NewsResponse?> fetchNews(String file) async {
    final apiResponse = await _apiService.fetchNews(file);

    if (apiResponse.error != null) {
      return _dbService.getNews(file);
    }

    if (apiResponse.data != null) {
      await _dbService.saveNews(apiResponse.data!, file);
    }

    return apiResponse.data;
  }
}
