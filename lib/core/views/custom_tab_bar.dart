import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> items;
  final void Function(int) onTabChanged;
  const CustomTabBar(
      {required this.items, required this.onTabChanged, super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.items.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabChanged(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      (index == _selectedIndex) ? Pallete.primaryColor : null,
                  borderRadius: BorderRadius.circular(10),
                  border: (index == _selectedIndex)
                      ? null
                      : Border.all(color: Colors.grey),
                ),
                child: Text(
                  widget.items[index],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
