import 'package:hive_flutter/adapters.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic_response.dart';

class DbService {
  static final instance = DbService._();

  DbService._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NewsTopicResponseAdapter());
    Hive.registerAdapter(NewsTopicAdapter());
  }

  List<T> getAll<T>(Box<T> box) => box.values.toList();

  int getCount<T>(Box<T> box) => box.length;

  T? getAt<T>(Box<T> box, int index) => box.getAt(index);

  Future<void> add<T>(Box<T> box, T data) async => await box.add(data);

  Future<void> update<T>(Box<T> box, int index, T note) async =>
      await box.putAt(index, note);

  Future<void> delete<T>(Box<T> box, int index) async =>
      await box.deleteAt(index);

  Future<void> clear<T>(Box<T> box) async => await box.clear();
}
