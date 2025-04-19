import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/utils/colon_splitter_extension.dart';

class HorizontalCardListView extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool showSerial;
  const HorizontalCardListView(
      {required this.title,
      required this.items,
      this.showSerial = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final mappedItems = items.toMapList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              mappedItems.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _cardItem(
                  context,
                  index + 1,
                  mappedItems[index],
                  showSerial,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardItem(
    BuildContext context,
    int serial,
    Map<String, String> item,
    bool showSerial,
  ) {
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
                    padding: EdgeInsets.only(left: (showSerial) ? 24.0 : 0),
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ),
        if (showSerial)
          Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
              backgroundColor: Colors.red[50],
              child: Text(
                serial.toString(),
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
