import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/views/no_item_found_view.dart';
import 'package:kagi_news_app/features/bookmarks/view_models/bookmark_viewmodel.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:provider/provider.dart';

import '../../../core/router/route_names.dart';
import '../../news_details/data/models/news_details_args.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BookmarkViewmodel>(context, listen: false).getAllBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<BookmarkViewmodel>(context, listen: false)
                    .clearAllBookmarks(),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Consumer<BookmarkViewmodel>(
        builder: (context, viewModel, _) =>
            (viewModel.bookmarks?.isNotEmpty == true)
                ? ListView.builder(
                    itemCount: viewModel.bookmarks?.length,
                    itemBuilder: (context, index) {
                      final news = viewModel.bookmarks?[index];
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
                          onBookmarkAdd: () async =>
                              await viewModel.addToBookmark(news),
                          onBookmarkRemove: () async =>
                              await viewModel.removeFromBookmark(news),
                        ),
                      );
                    },
                  )
                : Center(
                    child: NoItemFoundView(),
                  ),
      ),
    );
  }
}
