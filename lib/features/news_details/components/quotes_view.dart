import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';

class QuotesView extends StatelessWidget {
  final String quote;
  final String? author;
  final String? domain;
  final void Function()? onLaunch;
  const QuotesView(
      {required this.quote, this.author, this.domain, this.onLaunch, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Pallete.quoteCardBg,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (author != null)
                  Text(
                    "- $author",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                if (domain != null)
                  InkWell(
                    onTap: () => onLaunch!(),
                    child: Text(
                      "$domain ${Strings.tapToSeeMore}",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Pallete.urlColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.format_quote,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
