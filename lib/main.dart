import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/db/db_service.dart';
import 'package:kagi_news_app/core/db/hive_boxes.dart';
import 'package:kagi_news_app/core/di/di.dart';
import 'package:kagi_news_app/core/router/app_router.dart';
import 'package:kagi_news_app/features/bookmarks/view_models/bookmark_viewmodel.dart';
import 'package:kagi_news_app/features/news_list/view_models/news_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbService.init();
  await HiveBoxes.init();
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<NewsViewModel>()),
        ChangeNotifierProvider(create: (context) => getIt<BookmarkViewmodel>()),
      ],
      child: MaterialApp.router(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
      ),
    );
  }
}
