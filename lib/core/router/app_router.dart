import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/router/route_names.dart';
import 'package:kagi_news_app/features/bookmarks/views/bookmark_screen.dart';
import 'package:kagi_news_app/features/dashboard/views/dashboard_screen.dart';
import 'package:kagi_news_app/features/news_details/views/news_details_screen.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';
import 'package:kagi_news_app/features/news_list/views/news_list_screen.dart';
import 'package:kagi_news_app/features/splash/views/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: "/splash",
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => DashboardScreen(child: child),
      routes: [
        GoRoute(
          name: RouteNames.news,
          path: "/news",
          builder: (context, state) => const NewsListScreen(),
        ),
        GoRoute(
          name: RouteNames.bookmark,
          path: "/bookmark",
          builder: (context, state) => const BookmarkScreen(),
        )
      ],
    ),
    GoRoute(
      name: RouteNames.details,
      path: "/details",
      builder: (context, state) {
        final news = state.extra as News;
        return NewsDetailsScreen(news: news);
      },
    ),
  ],
);
