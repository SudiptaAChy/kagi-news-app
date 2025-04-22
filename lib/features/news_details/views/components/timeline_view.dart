import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/utils/colon_splitter_extension.dart';

class TimelineView extends StatelessWidget {
  final List<String> timelines;
  const TimelineView({required this.timelines, super.key});

  @override
  Widget build(BuildContext context) {
    final events = timelines.toMapList(splitter: "::");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          Strings.timeline,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 95,
              top: 0,
              bottom: 0,
              child: Container(
                width: 3,
                color: Colors.blue[100],
              ),
            ),
            ListView.builder(
              itemCount: events.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _eventItem(
                context,
                events[index],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _eventItem(BuildContext context, Map<String, String> item) {
    final date = item.entries.first.value;
    final description = item.entries.last.value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        spacing: 10,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              date,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          CircleAvatar(radius: 6, backgroundColor: Colors.blue[200]),
          Expanded(
              child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          )),
        ],
      ),
    );
  }
}
