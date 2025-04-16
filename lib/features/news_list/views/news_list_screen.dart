import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/router/route_names.dart';
import 'package:kagi_news_app/core/views/custom_tab_bar.dart';
import 'package:kagi_news_app/features/news_list/viewModels/news_view_model.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<NewsViewModel>(context, listen: false).getNewsTopics();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(
      builder: (context, viewModel, child) {
        final topicNames = viewModel.topics
                ?.map((item) => item.name)
                .whereType<String>()
                .toList() ??
            [];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (viewModel.isTopicsLoading)
                  ? showLoader()
                  : CustomTabBar(
                      items: topicNames,
                      onTabChanged: (index) {
                        viewModel.getNews(viewModel.topics?[index].file);
                      },
                    ),
            ),
            (viewModel.isNewsLoading)
                ? showLoader()
                : Expanded(
                    child: ListView.separated(
                      itemCount: viewModel.news?.news?.length ?? 0,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () => context.pushNamed(
                                RouteNames.details,
                                extra: viewModel.news?.news?[index],
                              ),
                          child: NewsListItem(
                            news: viewModel.news?.news?[index],
                          )),
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  ),
          ],
        );
      },
    );
  }

  Widget showLoader() {
    return CircularProgressIndicator();
  }
}
