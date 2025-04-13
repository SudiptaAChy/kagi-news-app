import 'package:kagi_news_app/features/news_list/data/model/news_category_response.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';
import 'package:kagi_news_app/features/news_list/data/services/news_service.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsService apiService;
  final NewsService dbService;

  NewsRepositoryImpl(this.apiService, this.dbService);

  @override
  Future<NewsCategoryResponse?> fetchNewsCategory() {
    final apiResponse = apiService.fetchNewsCategory();

    return apiResponse;
  }
}
