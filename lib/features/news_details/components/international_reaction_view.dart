import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/utils/colon_splitter_extension.dart';

class InternationalReactionView extends StatelessWidget {
  final List<String> reactions;
  const InternationalReactionView({required this.reactions, super.key});

  @override
  Widget build(BuildContext context) {
    final reactionList = reactions.toMapList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.internationalReactions,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ListView.builder(
          itemCount: reactionList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              _reactionItem(context, reactionList[index]),
        ),
      ],
    );
  }

  Widget _reactionItem(BuildContext context, Map<String, String> item) {
    final title = item.entries.first.value;
    final description = item.entries.last.value;
    return Card(
      elevation: 0,
      color: Pallete.cardBg,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
