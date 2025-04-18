import 'package:flutter/material.dart';

class BulletListView extends StatelessWidget {
  final String title;
  final List<String> items;
  const BulletListView({required this.title, required this.items, super.key});

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
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: CircleAvatar(radius: 4, backgroundColor: Colors.black),
              ),
              Expanded(child: Text(items[index])),
            ],
          ),
        )
      ],
    );
  }
}
