import 'package:get_it/get_it.dart';
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

  // Repositories
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(
        getIt<NewsApiService>(),
        getIt<NewsDbService>(),
      ));

  // ViewModels
  getIt.registerFactory<NewsViewModel>(
      () => NewsViewModel(getIt<NewsRepository>()));
}
