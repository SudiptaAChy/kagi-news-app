import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

class NewsDetailsArgs {
  final News news;
  final bool isBookmarked;
  final void Function() onBookmarkAdd;
  final void Function() onBookmarkRemove;

  NewsDetailsArgs(this.news, this.isBookmarked, this.onBookmarkAdd, this.onBookmarkRemove);
}
