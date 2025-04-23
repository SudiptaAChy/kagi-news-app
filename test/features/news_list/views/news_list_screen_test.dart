import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/views/custom_tab_bar.dart';
import 'package:kagi_news_app/core/views/no_item_found_view.dart';
import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:kagi_news_app/features/news_details/views/news_details_screen.dart';
import 'package:kagi_news_app/features/news_list/view_models/news_view_model.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:kagi_news_app/features/news_list/views/news_list_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../mock/mock_news_view_model_data_helper.dart';
import '../mock/news_list_screen_test.mocks.dart';

@GenerateMocks([NewsViewModel])
void main() {
  late MockNewsViewModel viewModel;
  late MockNewsViewModelDataHelper? dataHelper;

  setUp(() {
    dataHelper = MockNewsViewModelDataHelper();
    viewModel = MockNewsViewModel();

    when(viewModel.getNewsTopics()).thenAnswer((_) async {});
    when(viewModel.getNews(any)).thenAnswer((_) async {});
    when(viewModel.isBookmarked(any)).thenReturn(false);
    when(viewModel.addToBookmark(any)).thenAnswer((_) async {});
    when(viewModel.removeFromBookmark(any)).thenAnswer((_) async {});
  });

  tearDown(() {
    dataHelper = null;
    viewModel.dispose();
    resetMockitoState();
  });

  Widget buildTestWidget() {
    final router = GoRouter(initialLocation: "/news", routes: [
      GoRoute(
        path: "/news",
        builder: (context, state) => NewsListScreen(),
      ),
      GoRoute(
        name: "details",
        path: "/details",
        builder: (context, state) {
          final extras = state.extra as NewsDetailsArgs;
          return NewsDetailsScreen(args: extras);
        },
      ),
    ]);

    return ChangeNotifierProvider<NewsViewModel>.value(
      value: viewModel,
      child: MaterialApp.router(routerConfig: router),
    );
  }

  group("NewsListScreen", () {
    testWidgets("should show a loader when fetching topics and news", (tester) async {
      when(viewModel.isTopicsLoading).thenReturn(true);
      when(viewModel.topics).thenReturn(null);
      when(viewModel.isNewsLoading).thenReturn(true);
      when(viewModel.news).thenReturn(null);

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
    });

    testWidgets("should display topics list", (tester) async {
      when(viewModel.isTopicsLoading).thenReturn(false);
      when(viewModel.topics)
          .thenReturn(dataHelper?.mockNewsTopicResponse.categories);
      when(viewModel.isNewsLoading).thenReturn(false);
      when(viewModel.news).thenReturn(null);

      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(CustomTabBar), findsOneWidget);
      expect(find.text("World"), findsOneWidget);
      expect(find.text("Tech"), findsOneWidget);
    });

    testWidgets("should show no item found when no data is empty", (tester) async {
      when(viewModel.isTopicsLoading).thenReturn(false);
      when(viewModel.topics).thenReturn(null);
      when(viewModel.isNewsLoading).thenReturn(false);
      when(viewModel.news).thenReturn(null);

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(NoItemFoundView), findsOneWidget);
    });

    testWidgets("should show news list when news data is present", (tester) async {
      when(viewModel.isTopicsLoading).thenReturn(false);
      when(viewModel.topics).thenReturn(null);
      when(viewModel.isNewsLoading).thenReturn(false);
      when(viewModel.news).thenReturn(dataHelper?.mockNewsResponse);

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(NewsListItem), findsNWidgets(2));
      expect(find.text("News1"), findsOneWidget);
    });

    testWidgets("should show events list when events data is present", (tester) async {
      when(viewModel.isTopicsLoading).thenReturn(false);
      when(viewModel.topics).thenReturn(null);
      when(viewModel.isNewsLoading).thenReturn(false);
      when(viewModel.news).thenReturn(dataHelper?.mockEventsResponse);

      await tester.pumpWidget(buildTestWidget());

      expect(find.text("Events"), findsOneWidget);
      expect(find.text("Event1"), findsOneWidget);
      expect(find.text("People"), findsOneWidget);
      expect(find.text("Person1"), findsOneWidget);
    });
  });
}
