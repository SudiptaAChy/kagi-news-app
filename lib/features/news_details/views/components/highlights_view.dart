import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/utils/colon_splitter_extension.dart';

class HighlightsView extends StatelessWidget {
  final List<String> talkings;
  const HighlightsView({required this.talkings, super.key});

  @override
  Widget build(BuildContext context) {
    final highlightList = talkings.toMapList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Text(
          Strings.highlights,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              highlightList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: highlightItem(
                  context,
                  index + 1,
                  highlightList[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget highlightItem(
      BuildContext context, int index, Map<String, String> item) {
    final title = item.entries.first.value;
    final description = item.entries.last.value;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Card(
            elevation: 0,
            color: Pallete.cardBg,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: Text(title,
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  const SizedBox(height: 8),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            backgroundColor: Colors.red[50],
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
