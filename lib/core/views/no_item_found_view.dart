import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';

class NoItemFoundView extends StatelessWidget {
  const NoItemFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.search_off,
          size: 50,
        ),
        Text(
          Strings.nothingFound,
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    );
  }
}
