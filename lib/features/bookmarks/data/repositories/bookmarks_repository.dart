import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

abstract class BookmarksRepository {
  List<News>? getAllBookmarkedNews();
  Future<void> deleteAllBookmarkedNews();
  void removeBookmark(String id);
  void saveBookmark(News news);
}