import 'package:flutter/foundation.dart';
import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository;
  final BookmarksRepository _bookmarkRepository;

  NewsViewModel(this._newsRepository, this._bookmarkRepository);

  List<NewsTopic>? _topics;
  List<NewsTopic>? get topics => _topics;

  bool _isTopicsLoading = true;
  bool get isTopicsLoading => _isTopicsLoading;

  NewsResponse? _news;
  NewsResponse? get news => _news;

  bool _isNewsLoading = true;
  bool get isNewsLoading => _isNewsLoading;

  Future<void> getNewsTopics() async {
    _isTopicsLoading = true;
    notifyListeners();

    final result = await _newsRepository.fetchNewsTopic();
    _topics = result?.categories;

    _isTopicsLoading = false;
    notifyListeners();

    await getNews(_topics?[0].file);
  }

  Future<void> getNews(String? file) async {
    if (file == null) {
      _news = null;
      return;
    }

    _isNewsLoading = true;
    notifyListeners();

    _news = await _newsRepository.fetchNews(file);

    _isNewsLoading = false;
    notifyListeners();
  }

  Future<void> addToBookmark(News? news) async {
    if (news == null) return;

    await _bookmarkRepository.saveBookmark(news);

    notifyListeners();
  }

  Future<void> removeFromBookmark(News? news) async {
    if (news == null) return;

    await _bookmarkRepository.removeBookmark(news);

    notifyListeners();
  }

  bool isBookmarked(News? news) {
    if (news == null) return false;
    final allBookmarks = _bookmarkRepository.getAllBookmarkedNews();
    final found = allBookmarks?.any((item) => item == news) == true;
    return found;
  }
}
