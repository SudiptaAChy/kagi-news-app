import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/views/cached_network_image_view.dart';
import 'package:kagi_news_app/core/views/custom_chip_box.dart';
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
                      if (widget.news?.category?.isNotEmpty == true)
                        CustomChipBox(
                          title: widget.news?.category ?? "",
                          bgcolor: Colors.red.shade100,
                        ),
                      if (widget.news?.location?.isNotEmpty == true)
                        CustomChipBox(
                          title: widget.news?.location ?? "",
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
                onPressed: () {},
                icon: Icon(Icons.bookmark_add_outlined),
              ),
            ],
          ),
          Text(
            widget.news?.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (coverImage != null)
            CachedNetworkImageView(
              url: coverImage.image,
              source: coverImage.domain,
            ),
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
