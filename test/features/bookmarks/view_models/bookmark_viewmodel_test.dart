import 'package:flutter_test/flutter_test.dart';
import 'package:kagi_news_app/features/bookmarks/view_models/bookmark_viewmodel.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:mockito/mockito.dart';

import '../../news_list/mock/news_view_model_test.mocks.dart';
import '../mock/mock_bookmark_viewmodel_data_helper.dart';

void main() {
  late MockBookmarksRepository mockBookmarksRepository;
  late BookmarkViewmodel viewModel;
  MockBookmarkViewmodelDataHelper? dataHelper;

  setUp(() {
    dataHelper = MockBookmarkViewmodelDataHelper();
    mockBookmarksRepository = MockBookmarksRepository();
    viewModel = BookmarkViewmodel(mockBookmarksRepository);
  });

  tearDown(() {
    resetMockitoState();
    viewModel.dispose();
    dataHelper = null;
  });

  group("BookmarkViewmodel test", () {
    test("getAllBookmarks should returns all bookmarked news", () {
      when(mockBookmarksRepository.getAllBookmarkedNews())
          .thenReturn(dataHelper?.bookmarks);

      viewModel.getAllBookmarks();

      expect(viewModel.bookmarks?.length, 3);
      expect(viewModel.bookmarks?.first.title, "News1");
    });

    test("clearAllBookmarks should clear all bookmarked news", () async {
      when(mockBookmarksRepository.getAllBookmarkedNews())
          .thenReturn(dataHelper?.bookmarks);

      viewModel.getAllBookmarks();

      expect(viewModel.bookmarks?.length, 3);

      await viewModel.clearAllBookmarks();

      expect(viewModel.bookmarks?.length, 0);
    });

    group("addToBookmark", () {
      test("should not save to bookmark when news is null", () async {
        await viewModel.addToBookmark(null);

        verifyNever(mockBookmarksRepository.saveBookmark(any));
      });

      test("should save to bookmark when news is valid", () async {
        when(mockBookmarksRepository.saveBookmark(any))
            .thenAnswer((_) async => {});

        await viewModel.addToBookmark(News());

        verify(mockBookmarksRepository.saveBookmark(any)).called(1);
      });
    });

    group("removeFromBookmark", () {
      test("should not remove when news is null", () async {
        await viewModel.removeFromBookmark(null);

        verifyNever(mockBookmarksRepository.removeBookmark(any));
      });

      test("should remove when news is valid", () async {
        when(mockBookmarksRepository.removeBookmark(any))
            .thenAnswer((_) async => {});

        await viewModel.removeFromBookmark(News());

        verify(mockBookmarksRepository.removeBookmark(any)).called(1);
      });
    });

    group("isBookmarked", () {
      test("should return true when news is in bookmark", () {
        when(mockBookmarksRepository.isBookmarked(any)).thenReturn(true);

        final result = viewModel.isBookmarked(News());

        expect(result, true);
      });

      test("should return false when news is in bookmark", () {
        when(mockBookmarksRepository.isBookmarked(any)).thenReturn(false);

        final result = viewModel.isBookmarked(News());

        expect(result, false);
      });
    });
  });
}
