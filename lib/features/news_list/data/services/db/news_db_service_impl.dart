import 'package:kagi_news_app/core/db/db_service.dart';
import 'package:kagi_news_app/core/db/hive_boxes.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic/news_topic_response.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service.dart';

class NewsDBServiceImpl implements NewsDbService {
  final _dbService = DbService.instance;
  final _newsTopicBox = HiveBoxes.newsTopic;
  final _newsBox = HiveBoxes.news;

  @override
  NewsTopicResponse? getNewsTopics() => _dbService.getAt(_newsTopicBox, 0);

  @override
  Future<void> saveNewsTopics(NewsTopicResponse data) async {
    await _dbService.clear(_newsTopicBox);
    await _dbService.add(_newsTopicBox, data);
  }

  @override
  NewsResponse? getNews(String file) => _dbService.get(_newsBox, file);

  @override
  Future<void> saveNews(NewsResponse data, String file) async {
    await _dbService.delete(_newsBox, file);
    await _dbService.save(_newsBox, file, data);
  }
}
