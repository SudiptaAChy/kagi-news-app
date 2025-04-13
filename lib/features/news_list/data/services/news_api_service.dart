import 'package:dio/dio.dart';
import 'package:kagi_news_app/core/network/api_router.dart';

import 'package:kagi_news_app/features/news_list/data/model/news_category_response.dart';
import 'package:kagi_news_app/features/news_list/data/services/news_service.dart';

class NewsApiService implements NewsService {
  final dio = Dio();

  @override
  Future<NewsCategoryResponse?> fetchNewsCategory() async {
    final response = await dio.get(ApiRouter.newsCategories);
    
    if (response.statusCode == 200) {
      return NewsCategoryResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
