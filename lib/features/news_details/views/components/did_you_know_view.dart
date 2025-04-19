import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';

class DidYouKnowView extends StatelessWidget {
  final String text;
  const DidYouKnowView({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.lightbulb,
                  color: Colors.yellow,
                ),
                Text(
                  Strings.didYouKnow,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
