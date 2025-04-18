import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/views/no_item_found_view.dart';
import 'package:kagi_news_app/features/bookmarks/viewModels/bookmark_viewmodel.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
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
        builder: (context, viewModel, child) =>
            (viewModel.bookmarks?.isNotEmpty == true)
                ? ListView.builder(
                    itemCount: viewModel.bookmarks?.length,
                    itemBuilder: (context, index) =>
                        NewsListItem(news: viewModel.bookmarks?[index]),
                  )
                : Center(
                    child: NoItemFoundView(),
                  ),
      ),
    );
  }
}
