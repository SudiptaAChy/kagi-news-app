import 'package:kagi_news_app/features/news_list/data/models/news/event.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news_response.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic.dart';
import 'package:kagi_news_app/features/news_list/data/models/news_topic/news_topic_response.dart';

class MockNewsViewModelDataHelper {
  final mockNewsTopicResponse = NewsTopicResponse(timestamp: 100, categories: [
    NewsTopic(name: "World", file: "world.json"),
    NewsTopic(name: "Tech", file: "tech.json"),
  ]);

  final mockNewsResponse =
      NewsResponse(category: "World", timestamp: 10, news: [
    News(title: "News1"),
    News(title: "News2"),
  ], events: []);

  final mockEventsResponse = NewsResponse(
    timestamp: 10,
    news: [],
    events: [
      Event(type: EventType.event, content: "Event1"),
      Event(type: EventType.people, content: "Person1"),
    ],
  );

  final mockBookmarkResponse = [
    News(title: "News1"),
  ];
}
