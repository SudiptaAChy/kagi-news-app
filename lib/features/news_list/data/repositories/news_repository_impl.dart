import 'package:kagi_news_app/features/news_list/data/model/news_topic_response.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService apiService;
  final NewsDbService dbService;

  NewsRepositoryImpl(this.apiService, this.dbService);

  @override
  Future<NewsTopicResponse?> fetchNewsTopic() async {
    final apiResponse = await apiService.fetchNewsTopic();

    if(apiResponse.error != null) {
      // db call
    } else {
      return apiResponse.data;
    }
  }
}
