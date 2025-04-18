import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/bookmarks/data/services/db/bookmarks_db_service.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

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
  void removeBookmark(String id) => _dbService.removeBookmark(id);

  @override
  void saveBookmark(News news) => _dbService.saveBookmark(news);
}
