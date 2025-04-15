import 'package:hive/hive.dart';

import '../../features/news_list/data/model/news_topic/news_topic_response.dart';

class HiveBoxes {
  HiveBoxes._();

  static late Box<NewsTopicResponse> newsTopic;

  static Future<void> init() async {
    newsTopic = await Hive.openBox<NewsTopicResponse>("news_topics");
  }
}