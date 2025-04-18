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
  }
}
