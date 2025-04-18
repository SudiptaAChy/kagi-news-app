import 'package:flutter/material.dart';

class PlainInformationView extends StatelessWidget {
  final String title;
  final String description;
  const PlainInformationView(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
