import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  static const List<Map<String, dynamic>> bottomBarItems = [
    {
      "label": Strings.news,
      "icon": Icons.home_filled,
      "route": "/news",
    },
    {
      "label": Strings.bookmark,
      "icon": Icons.bookmark_added_outlined,
      "route": "/bookmark",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: SafeArea(child: bottomNavBar(context)),
    );
  }

  Widget bottomNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.navBarBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bottomBarItems.length, (index) {
            final item = bottomBarItems[index];
            final isSelected =
                GoRouterState.of(context).uri.toString() == item['route'];

            return GestureDetector(
              onTap: () {
                if (!isSelected) context.go(item['route']);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Pallete.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      item['icon'],
                      color: isSelected
                          ? Pallete.navItemActiveColor
                          : Pallete.navItemInactiveColor,
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Text(
                        item['label'],
                        style: TextStyle(
                          color: Pallete.navItemActiveColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
