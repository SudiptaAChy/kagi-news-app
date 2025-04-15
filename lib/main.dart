import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/db/db_service.dart';
import 'package:kagi_news_app/core/db/hive_boxes.dart';
import 'package:kagi_news_app/core/router/app_router.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository_impl.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service_impl.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbService.init();
  await HiveBoxes.init();

  final repo = NewsRepositoryImpl(NewsApiServiceImpl(), NewsDBServiceImpl());
  final result1 = await repo.fetchNewsTopic();
  // final result2 = await repo.fetchNews("cryptocurrency.json");
  final result2 = await repo.fetchNews("world.json");
  debugPrint("result1: ${result1?.timestamp}");
  debugPrint("result2: ${result2?.category}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
    );
  }
}
