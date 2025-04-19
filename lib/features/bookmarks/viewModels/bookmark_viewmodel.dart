import 'package:flutter/cupertino.dart';
import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

class BookmarkViewmodel extends ChangeNotifier {
  final BookmarksRepository _repository;

  BookmarkViewmodel(this._repository);

  List<News>? _bookmarks;
  List<News>? get bookmarks => _bookmarks;

  void getAllBookmarks() {
    _bookmarks = _repository.getAllBookmarkedNews();
    notifyListeners();
  }

  Future<void> clearAllBookmarks() async {
    await _repository.deleteAllBookmarkedNews();
    _bookmarks?.clear();
    notifyListeners();
  }

  Future<void> addToBookmark(News? news) async {
    if (news == null) return;

    await _repository.saveBookmark(news);

    notifyListeners();
  }

  Future<void> removeFromBookmark(News? news) async {
    if (news == null) return;

    await _repository.removeBookmark(news);

    notifyListeners();
  }

  bool isBookmarked(News? news) {
    if (news == null) return false;

    return _repository.isBookmarked(news);
  }
}
