import 'package:flutter_test/flutter_test.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:kagi_news_app/features/news_list/view_models/news_view_model.dart';
import 'package:kagi_news_app/features/bookmarks/data/repositories/bookmarks_repository.dart';
import 'package:kagi_news_app/features/news_list/data/repositories/news_repository.dart';

import '../mock/mock_news_view_model_data_helper.dart';
import '../mock/news_view_model_test.mocks.dart';

@GenerateMocks([NewsRepository, BookmarksRepository])
void main() {
  late MockNewsRepository mockNewsRepository;
  late MockBookmarksRepository mockBookmarksRepository;
  late NewsViewModel viewModel;
  MockNewsViewModelDataHelper? dataHelper;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    mockBookmarksRepository = MockBookmarksRepository();
    viewModel = NewsViewModel(mockNewsRepository, mockBookmarksRepository);
    dataHelper = MockNewsViewModelDataHelper();
  });

  tearDown(() {
    resetMockitoState();
    viewModel.dispose();
    dataHelper = null;
  });

  group("NewsViewModel test", () {
    group("getNewsTopics", () {
      test(
          "should update topics and fetch news when topic fetch is successfull",
          () async {
        when(mockNewsRepository.fetchNewsTopic())
            .thenAnswer((_) async => dataHelper?.mockNewsTopicResponse);
        when(mockNewsRepository.fetchNews(any))
            .thenAnswer((_) async => dataHelper?.mockNewsResponse);
        when(mockBookmarksRepository.getAllBookmarkedNews()).thenReturn([]);

        await viewModel.getNewsTopics();

        expect(viewModel.topics, isNotNull);
        expect(viewModel.topics?.length, 2);
        expect(viewModel.topics?.first.name, "World");
        expect(viewModel.isTopicsLoading, false);

        expect(viewModel.news?.category, "World");

        verify(mockNewsRepository.fetchNewsTopic()).called(1);
        verify(mockNewsRepository.fetchNews("world.json")).called(1);
      });

      test(
          "should not update topics and don't fetch news when topic fetch is unsuccessfull",
          () async {
        when(mockNewsRepository.fetchNewsTopic()).thenAnswer((_) async => null);

        await viewModel.getNewsTopics();

        expect(viewModel.topics, isNull);

        verify(mockNewsRepository.fetchNewsTopic()).called(1);
        verifyNever(mockNewsRepository.fetchNews(any));
      });
    });

    group("getNews", () {
      test("should not update news when file is null", () async {
        await viewModel.getNews(null);

        expect(viewModel.news, isNull);

        verifyNever(mockNewsRepository.fetchNews(any));
        verifyNever(mockBookmarksRepository.getAllBookmarkedNews());
      });

      test("should update news when file is anything except onthisday.json",
          () async {
        when(mockNewsRepository.fetchNews(any))
            .thenAnswer((_) async => dataHelper?.mockNewsResponse);
        when(mockBookmarksRepository.getAllBookmarkedNews())
            .thenReturn(dataHelper?.mockBookmarkResponse);

        await viewModel.getNews("world.json");

        expect(viewModel.news, isNotNull);
        expect(viewModel.news?.category, "World");

        verify(mockNewsRepository.fetchNews(any)).called(1);
      });
    });

    group("addToBookmark", () {
      test("should not add to bookmark when news is null", () async {
        await viewModel.addToBookmark(null);

        verifyNever(mockBookmarksRepository.saveBookmark(any));
      });

      test("should add to bookmark when news is valid", () async {
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
      test("should return false when news is null", () {
        final result = viewModel.isBookmarked(null);

        expect(result, false);
      });

      test("should return false when news is not present in bookmarks", () {
        when(mockBookmarksRepository.getAllBookmarkedNews())
            .thenReturn(dataHelper?.mockBookmarkResponse);

        final result = viewModel.isBookmarked(News());

        expect(result, false);
      });

      test("should return true when news is present in bookmarks", () {
        when(mockBookmarksRepository.getAllBookmarkedNews())
            .thenReturn(dataHelper?.mockBookmarkResponse);

        final result = viewModel.isBookmarked(dataHelper?.mockBookmarkResponse[0]);

        expect(result, true);
      });
    });
  });
}
