import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/views/cached_network_image_view.dart';
import 'package:kagi_news_app/core/views/custom_chip_box.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

class NewsListItem extends StatelessWidget {
  final News? news;
  final bool isBookmarked;
  final void Function() onBookmarkAdd;
  final void Function() onBookmarkRemove;

  const NewsListItem(
      {required this.news,
      required this.isBookmarked,
      required this.onBookmarkAdd,
      required this.onBookmarkRemove,
      super.key});

  @override
  Widget build(BuildContext context) {
    final coverImage = news?.articles
        ?.where((item) => item.image != null && item.image!.isNotEmpty)
        .toList()
        .firstOrNull;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      if (news?.category?.isNotEmpty == true)
                        CustomChipBox(
                          title: news?.category ?? "",
                          bgcolor: Colors.red.shade100,
                        ),
                      if (news?.location?.isNotEmpty == true)
                        CustomChipBox(
                          title: news?.location ?? "",
                          icon: Icon(
                            Icons.location_pin,
                            size: 15,
                          ),
                          bgcolor: Colors.grey.shade300,
                        ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (isBookmarked) {
                    onBookmarkRemove();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Bookmark removed successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    onBookmarkAdd();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to bookmark successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                icon: (isBookmarked)
                    ? Icon(Icons.bookmark_added)
                    : Icon(Icons.bookmark_add_outlined),
              )
            ],
          ),
          Text(
            news?.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (coverImage != null)
            CachedNetworkImageView(
              url: coverImage.image,
              source: coverImage.domain,
            ),
          Text(
            "${news?.articles?.length ?? 0} reports",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
