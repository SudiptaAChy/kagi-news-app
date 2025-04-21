import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/router/route_names.dart';
import 'package:kagi_news_app/features/splash/views/splash_screen.dart';

void main() {
  testWidgets("SplashScreen should shows title, subtitle, brand icon and navigates after animation",
      (tester) async {
    final router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          name: RouteNames.news,
          path: '/news',
          builder: (context, state) =>
              const Scaffold(body: Text('News Screen')),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => SplashScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));

    expect(find.text(Strings.appTitle), findsOneWidget);
    expect(find.text(Strings.poweredBy), findsOneWidget);
    expect(find.text(Strings.kite), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.text('News Screen'), findsOneWidget);
  });
}
