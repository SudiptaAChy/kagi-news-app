import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/router/route_names.dart';
import 'package:kagi_news_app/features/dashboard/dashboard_screen.dart';
import 'package:kagi_news_app/features/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RouteNames.dashboard,
      path: "/dashboard",
      builder: (context, state) => const DashboardScreen(),
    )
  ],
);
