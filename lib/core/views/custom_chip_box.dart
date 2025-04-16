import 'package:flutter/material.dart';

class CustomChipBox extends StatelessWidget {
  final String title;
  final Icon? icon;
  final Color bgcolor;
  const CustomChipBox(
      {required this.title, this.icon, required this.bgcolor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          if (icon != null) icon!,
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
