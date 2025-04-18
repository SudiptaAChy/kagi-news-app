import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/perspective.dart';

class PerspectiveView extends StatelessWidget {
  final List<Perspective> perspectives;
  final void Function(String? url)? onLaunch;
  const PerspectiveView({required this.perspectives, this.onLaunch, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.perspectives,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              perspectives.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: perspectiveItem(
                      context,
                      perspectives[index],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget perspectiveItem(BuildContext context, Perspective item) {
    final data = item.text?.split(":");
    final title = data?[0].trim();
    final description = data?[1].trim();
    return Card(
      elevation: 0,
      color: Pallete.cardBg,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description ?? "",
                style: Theme.of(context).textTheme.bodyMedium),
            if (item.sources?.first.url != null)
              InkWell(
                onTap: () => onLaunch!(item.sources?.first.url),
                child: Text(
                  "${item.sources?.first.name} ${Strings.tapToSeeMore}",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Pallete.urlColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
