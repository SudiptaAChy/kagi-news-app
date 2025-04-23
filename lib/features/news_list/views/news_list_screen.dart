import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/router/route_names.dart';
import 'package:kagi_news_app/core/utils/url_launcher_utils.dart';
import 'package:kagi_news_app/core/views/custom_tab_bar.dart';
import 'package:kagi_news_app/core/views/no_item_found_view.dart';
import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/event.dart';
import 'package:kagi_news_app/features/news_list/view_models/news_view_model.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsViewModel>(context, listen: false).getNewsTopics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsViewModel>(
      builder: (context, viewModel, _) {
        final topicNames = viewModel.topics
                ?.map((item) => item.name)
                .whereType<String>()
                .toList() ??
            [];

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
              Expanded(
                child: (viewModel.isNewsLoading)
                    ? Center(child: showLoader())
                    : (viewModel.news == null)
                        ? NoItemFoundView()
                        : (viewModel.news?.events?.isEmpty == true)
                            ? showNewsItems(viewModel)
                            : showEventsItems(viewModel),
              )
            ],
          ),
        );
      },
    );
  }

  Widget showNewsItems(NewsViewModel viewModel) {
    if (viewModel.news?.news?.isEmpty == true) return NoItemFoundView();

    return ListView.separated(
      itemCount: viewModel.news?.news?.length ?? 0,
      itemBuilder: (context, index) {
        final news = viewModel.news?.news?[index];
        final isBookmarked = viewModel.isBookmarked(news);

        return InkWell(
          onTap: () => context.pushNamed(
            RouteNames.details,
            extra: NewsDetailsArgs(
              news!,
              isBookmarked,
              () => viewModel.addToBookmark(news),
              () => viewModel.removeFromBookmark(news),
            ),
          ),
          child: NewsListItem(
            news: news,
            isBookmarked: isBookmarked,
            onBookmarkAdd: () async => await viewModel.addToBookmark(news),
            onBookmarkRemove: () async =>
                await viewModel.removeFromBookmark(news),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget showEventsItems(NewsViewModel viewModel) {
    if (viewModel.news?.events?.isEmpty == true) return NoItemFoundView();

    final events = viewModel.news?.events
        ?.where((event) => event.type == EventType.event)
        .toList();
    final peoples = viewModel.news?.events
        ?.where((event) => event.type == EventType.people)
        .toList();

    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 0,
        children: [
          Text(
            Strings.events,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 5),
          showEventsList(events),
          SizedBox(height: 30),
          Text(
            Strings.people,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 5),
          showEventsList(peoples),
        ],
      ),
    );
  }

  Widget showEventsList(List<Event>? events) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: events?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final event = events?[index];
        return Row(
          spacing: 4,
          children: [
            Text(
              event?.year ?? "",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Expanded(
              child: Html(
                data: event?.content,
                onLinkTap: (url, attributes, element) => _launchURL(url),
              ),
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String? url) {
    try {
      launchURL(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 2),
      ));
    }
  }

  Widget showLoader() {
    return CircularProgressIndicator();
  }
}
