import 'package:flutter/material.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) => NewsListItem(),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
