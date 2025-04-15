import 'package:kagi_news_app/features/news_list/data/model/news_topic_response.dart';

abstract class NewsDbService {
  Future<NewsTopicResponse?> getNewsTopics();
  Future<void> saveNewsTopics(NewsTopicResponse data);
}
