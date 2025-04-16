import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';

class NewsListItem extends StatefulWidget {
  final News? news;
  const NewsListItem({required this.news, super.key});

  @override
  State<NewsListItem> createState() => _NewsListItemState();
}

class _NewsListItemState extends State<NewsListItem> {
  @override
  Widget build(BuildContext context) {
    final coverImage = widget.news?.articles
        ?.where((item) => item.image != null && item.image!.isNotEmpty)
        .toList()
        .firstOrNull
        ?.image;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  (widget.news?.category != null)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.news?.category ?? "",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )
                      : Container(),
                  SizedBox(width: 10),
                  (widget.news?.location != null)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 15,
                              ),
                              Text(
                                widget.news?.location ?? "",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_add_outlined),
              ),
            ],
          ),
          Text(
            widget.news?.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          (coverImage != null)
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: coverImage,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              : Container(),
          SizedBox(height: 5),
          Text(
            "${widget.news?.articles?.length ?? 0} reports",
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
