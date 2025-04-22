import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/views/no_item_found_view.dart';
import 'package:kagi_news_app/features/bookmarks/view_models/bookmark_view_model.dart';
import 'package:kagi_news_app/features/bookmarks/views/bookmark_screen.dart';
import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:kagi_news_app/features/news_details/views/news_details_screen.dart';
import 'package:kagi_news_app/features/news_list/views/components/news_list_item.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../mock/bookmark_screen_test.mocks.dart';
import '../mock/mock_bookmark_view_model_data_helper.dart';

@GenerateMocks([BookmarkViewmodel])
void main() {
  late MockBookmarkViewmodel viewModel;
  late MockBookmarkViewmodelDataHelper? dataHelper;

  setUp(() {
    dataHelper = MockBookmarkViewmodelDataHelper();
    viewModel = MockBookmarkViewmodel();

    when(viewModel.getAllBookmarks()).thenReturn(null);
    when(viewModel.isBookmarked(any)).thenReturn(true);
  });

  Widget buildTestWidget() {
    final router = GoRouter(initialLocation: "/bookmark", routes: [
      GoRoute(
        path: "/bookmark",
        builder: (context, state) => BookmarkScreen(),
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

    return ChangeNotifierProvider<BookmarkViewmodel>.value(
      value: viewModel,
      child: MaterialApp.router(routerConfig: router),
    );
  }

  group("BookmarkScreen", () {
    testWidgets("should show no item found when bookmark is empty", (tester) async {
      when(viewModel.bookmarks).thenReturn([]);

      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(NoItemFoundView), findsOneWidget);
    });

    testWidgets("should show news list when bookmark exists", (tester) async {
      when(viewModel.bookmarks).thenReturn(dataHelper?.bookmarks);

      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(NewsListItem), findsNWidgets(3));
      expect(find.text("News1"), findsOneWidget);
    });

    testWidgets("should clear all bookmarks when delete icon tap", (tester) async {
      when(viewModel.bookmarks).thenReturn(dataHelper?.bookmarks);

      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      final deleteIcon = find.byIcon(Icons.delete);
      expect(deleteIcon, findsOneWidget);

      when(viewModel.clearAllBookmarks()).thenAnswer((_) async {});

      await tester.tap(deleteIcon);
      await tester.pumpAndSettle();

      verify(viewModel.clearAllBookmarks()).called(1);
    });

    testWidgets("should navigate to news details screen when tapping on bookmarked news item", (tester) async {
      when(viewModel.bookmarks).thenReturn(dataHelper?.bookmarks);

      await tester.pumpWidget(buildTestWidget());
      await tester.pumpAndSettle();

      final newsItem = find.byWidgetPredicate(
          (widget) => widget is NewsListItem && widget.news?.title == "News1"
      );

      expect(newsItem, findsOneWidget);

      await tester.tap(newsItem);
      await tester.pumpAndSettle();

      expect(find.byType(NewsDetailsScreen), findsOneWidget);
    });
  });
}
