import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/bookmarks/data/services/db/bookmarks_db_service.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';

class BookmarksRepositoryImpl extends BookmarksRepository {
  final BookmarksDbService _dbService;

  BookmarksRepositoryImpl(this._dbService);

  @override
  Future<void> deleteAllBookmarkedNews() async {
    await _dbService.deleteAllBookmarkedNews();
  }

  @override
  List<News>? getAllBookmarkedNews() => _dbService.getAllBookmarkedNews();

  @override
  Future<void> removeBookmark(News news) async =>
      await _dbService.removeBookmark(news);

  @override
  Future<void> saveBookmark(News news) async =>
      await _dbService.saveBookmark(news);

  @override
  bool isBookmarked(News news) => _dbService.isBookmarked(news);
}
