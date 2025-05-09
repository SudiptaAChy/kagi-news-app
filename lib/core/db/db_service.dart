import 'package:hive_flutter/adapters.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/article.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/domain.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/event.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/perspective.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/source.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

class DbService {
  static final instance = DbService._();

  DbService._();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(NewsTopicResponseAdapter());
    Hive.registerAdapter(NewsTopicAdapter());

    Hive.registerAdapter(ArticleAdapter());
    Hive.registerAdapter(DomainAdapter());
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(NewsResponseAdapter());
    Hive.registerAdapter(PerspectiveAdapter());
    Hive.registerAdapter(SourceAdapter());
    Hive.registerAdapter(EventAdapter());
    Hive.registerAdapter(EventTypeAdapter());
  }

  List<T> getAll<T>(Box<T> box) => box.values.toList();

  int getCount<T>(Box<T> box) => box.length;

  T? getAt<T>(Box<T> box, int index) => box.getAt(index);

  T? get<T>(Box<T> box, String key) => box.get(key);

  Future<void> add<T>(Box<T> box, T data) async => await box.add(data);

  Future<void> save<T>(Box<T> box, String key, T data) async =>
      await box.put(key, data);

  Future<void> update<T>(Box<T> box, int index, T data) async =>
      await box.putAt(index, data);

  Future<void> delete<T>(Box<T> box, String key) async => await box.delete(key);

  Future<void> deleteAt<T>(Box<T> box, int index) async =>
      await box.deleteAt(index);

  Future<void> clear<T>(Box<T> box) async => await box.clear();
}
