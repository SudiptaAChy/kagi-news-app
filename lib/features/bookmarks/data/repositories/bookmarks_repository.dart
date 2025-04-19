import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';

abstract class BookmarksRepository {
  List<News>? getAllBookmarkedNews();
  Future<void> deleteAllBookmarkedNews();
  Future<void> removeBookmark(News news);
  Future<void> saveBookmark(News news);
  bool isBookmarked(News news);
}
