import 'package:kagi_news_app/core/db/db_service.dart';
import 'package:kagi_news_app/core/db/hive_boxes.dart';
import 'package:kagi_news_app/features/news_list/data/model/news_topic/news_topic_response.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service.dart';

class NewsDBServiceImpl implements NewsDbService {
  final _dbService = DbService.instance;
  final _newsTopicBox = HiveBoxes.newsTopic;

  @override
  Future<NewsTopicResponse?> getNewsTopics() async => _dbService.getAt(_newsTopicBox, 0);

  @override
  Future<void> saveNewsTopics(NewsTopicResponse data) async {
    await _dbService.clear(_newsTopicBox);
    await _dbService.add(_newsTopicBox, data);
  }
}
