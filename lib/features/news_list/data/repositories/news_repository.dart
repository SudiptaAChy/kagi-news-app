import 'package:kagi_news_app/features/news_list/data/model/news_category_response.dart';

abstract class NewsRepository {
  Future<NewsCategoryResponse?> fetchNewsCategory();
}
