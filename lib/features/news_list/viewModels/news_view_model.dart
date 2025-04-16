import 'package:flutter/foundation.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsRepository _repository;

  NewsViewModel(this._repository);

  List<NewsTopic>? _topics;
  List<NewsTopic>? get topics => _topics;

  bool _isTopicsLoading = false;
  bool get isTopicsLoading => _isTopicsLoading;

  NewsResponse? _news;
  NewsResponse? get news => _news;

  bool _isNewsLoading = false;
  bool get isNewsLoading => _isNewsLoading;

  void getNewsTopics() async {
    _isTopicsLoading = true;

    final result = await _repository.fetchNewsTopic();
    _topics = result?.categories;

    _isTopicsLoading = false;

    notifyListeners();

    getNews(_topics?[0].file);
  }

  void getNews(String? file) async {
    if (file == null) return;

    _isNewsLoading = true;

    _news = await _repository.fetchNews(file);

    _isNewsLoading = false;

    notifyListeners();
  }
}
