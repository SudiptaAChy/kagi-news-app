import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/features/dashboard/views/dashboard_screen.dart';

void main() {
  testWidgets(
      "DashboardScreen should display child widget, bottom navigation bar and navigates on tap",
      (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/news',
      routes: [
        GoRoute(
          path: '/news',
          builder: (context, state) =>
              const DashboardScreen(child: Text('News View')),
        ),
        GoRoute(
          path: '/bookmark',
          builder: (context, state) =>
              const DashboardScreen(child: Text('Bookmark View')),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    expect(find.text('News View'), findsOneWidget);
    expect(find.text(Strings.news), findsOneWidget);
    expect(find.text(Strings.bookmark), findsNothing);
    expect(find.byIcon(Icons.home_filled), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_added_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.bookmark_added_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Bookmark View'), findsOneWidget);
    expect(find.text(Strings.bookmark), findsOneWidget);
  });
}
