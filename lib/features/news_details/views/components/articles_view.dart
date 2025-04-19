import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/utils/date_time_helper.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/article.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/domain.dart';

class ArticlesView extends StatelessWidget {
  final List<Article> articles;
  final List<Domain>? domains;
  final void Function(String? url) onLaunch;
  const ArticlesView(
      {required this.articles,
      this.domains,
      required this.onLaunch,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.relatedArticles,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ListView.builder(
          itemCount: articles.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final newsIcon = domains
                ?.firstWhere((item) => item.name == articles[index].domain)
                .favicon;
            return _articleItem(context, newsIcon, articles[index]);
          },
        )
      ],
    );
  }

  Widget _articleItem(BuildContext context, String? newsIcon, Article item) {
    return InkWell(
      onTap: () => onLaunch(item.link),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        CachedNetworkImage(
                          width: 25,
                          height: 25,
                          imageUrl: newsIcon ?? "",
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Text(
                          item.domain ?? "",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Text(
                      item.title ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      formatDateTimeToReadable(item.date),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              if (item.image?.isNotEmpty == true)
                CachedNetworkImage(
                  width: 150,
                  imageUrl: item.image!,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
            ],
          ),
        ),
      ),
    );
  }
}
