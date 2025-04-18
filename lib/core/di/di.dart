import 'package:get_it/get_it.dart';
import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository_impl.dart';
import 'package:kagi_news_app/features/bookmarks/data/services/db/bookmarks_db_service.dart';
import 'package:kagi_news_app/features/bookmarks/data/services/db/bookmarks_db_service_impl.dart';
import 'package:kagi_news_app/features/bookmarks/viewModels/bookmark_viewmodel.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository_impl.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service.dart';
import 'package:kagi_news_app/features/news_list/data/services/api/news_api_service_impl.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service.dart';
import 'package:kagi_news_app/features/news_list/data/services/db/news_db_service_impl.dart';
import 'package:kagi_news_app/features/news_list/viewModels/news_view_model.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Services
  getIt.registerLazySingleton<NewsApiService>(() => NewsApiServiceImpl());
  getIt.registerLazySingleton<NewsDbService>(() => NewsDBServiceImpl());
  getIt.registerLazySingleton<BookmarksDbService>(() => BookmarksDbServiceImpl());

  // Repositories
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(
        getIt<NewsApiService>(),
        getIt<NewsDbService>(),
      ));
      getIt.registerLazySingleton<BookmarksRepository>(() => BookmarksRepositoryImpl(
        getIt<BookmarksDbService>(),
      ));

  // ViewModels
  getIt.registerFactory<NewsViewModel>(
      () => NewsViewModel(getIt<NewsRepository>()));
  getIt.registerFactory<BookmarkViewmodel>(
      () => BookmarkViewmodel(getIt<BookmarksRepository>()));
}
