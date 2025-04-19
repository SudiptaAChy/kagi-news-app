import 'package:kagi_news_app/core/db/db_service.dart';
import 'package:kagi_news_app/core/db/hive_boxes.dart';
import 'package:kagi_news_app/features/bookmarks/data/services/db/bookmarks_db_service.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';

class BookmarksDbServiceImpl implements BookmarksDbService {
  final _dbService = DbService.instance;
  final _bookmarks = HiveBoxes.bookmarks;

  @override
  Future<void> deleteAllBookmarkedNews() async {
    await _dbService.clear(_bookmarks);
  }

  @override
  List<News>? getAllBookmarkedNews() {
    final result = _dbService.getAll(_bookmarks);
    return result;
  }

  @override
  Future<void> removeBookmark(News news) async {
    final allBookmarks = _dbService.getAll(_bookmarks);
    for (int index = 0; index < allBookmarks.length; index++) {
      if (allBookmarks[index] == news) {
        await _dbService.deleteAt(_bookmarks, index);
        break;
      }
    }
  }

  @override
  Future<void> saveBookmark(News news) async {
    final isExists =
        _dbService.getAll(_bookmarks).any((item) => item == news);
    if (!isExists) {
      await _dbService.add(_bookmarks, news);
    }
  }

  @override
  bool isBookmarked(News news) {
    final isExists =
        _dbService.getAll(_bookmarks).any((item) => item == news);
    return isExists;
  }
}
