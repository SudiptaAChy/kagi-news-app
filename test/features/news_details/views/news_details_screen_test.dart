import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kagi_news_app/core/views/cached_network_image_view.dart';
import 'package:kagi_news_app/core/views/custom_chip_box.dart';
import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:kagi_news_app/features/news_details/views/components/articles_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/bullet_list_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/did_you_know_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/highlights_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/horizontal_card_list_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/international_reaction_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/perspective_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/plain_information_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/quotes_view.dart';
import 'package:kagi_news_app/features/news_details/views/components/timeline_view.dart';
import 'package:kagi_news_app/features/news_details/views/news_details_screen.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';

import '../mock/mock_news_details_data_helper.dart';

void main() {
  late MockNewsDetailsDataHelper? dataHelper;

  setUp(() {
    dataHelper = MockNewsDetailsDataHelper();
  });

  tearDown(() {
    dataHelper = null;
  });

  group("NewsDetailsScreen", () {
    testWidgets("should display appbar back icon", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: NewsDetailsScreen(
              args: NewsDetailsArgs(News(), false, () {}, () {}))));

      expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    });

    testWidgets("should display appbar bookmark add icon", (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: NewsDetailsScreen(
              args: NewsDetailsArgs(News(), false, () {}, () {}))));

      expect(find.byIcon(Icons.bookmark_add_outlined), findsOneWidget);
    });

    testWidgets("should display appbar bookmark already added icon",
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: NewsDetailsScreen(
              args: NewsDetailsArgs(News(), true, () {}, () {}))));

      expect(find.byIcon(Icons.bookmark_added), findsOneWidget);
    });

    testWidgets("should display all body contents", (tester) async {
      await tester.pumpWidget(
          MaterialApp(home: NewsDetailsScreen(args: dataHelper!.args())));

      expect(find.byType(CustomChipBox), findsNWidgets(2));
      expect(find.text("Technology"), findsOneWidget);
      expect(find.text("Silicon Valley"), findsOneWidget);

      expect(find.text("AI title"), findsOneWidget);
      expect(find.text("AI summary"), findsOneWidget);

      expect(find.byType(DidYouKnowView), findsOneWidget);
      expect(find.text("AI is now capable of beating humans in chess."), findsOneWidget);

      expect(find.byType(CachedNetworkImageView), findsOneWidget);

      expect(find.byType(HighlightsView), findsOneWidget);
      expect(find.text("AI"), findsNWidgets(2));
      expect(find.text("Artificial Intelligence"), findsOneWidget);

      expect(find.byType(QuotesView), findsOneWidget);
      expect(find.text("AI will reshape the world."), findsOneWidget);
      expect(find.text("- John Doe"), findsOneWidget);

      expect(find.byType(PerspectiveView), findsOneWidget);
      expect(find.text("AI will revolutionize healthcare."), findsOneWidget);

      expect(find.byType(PlainInformationView), findsNWidgets(4));
      expect(find.text("AI has been a research topic for decades."), findsOneWidget);

      expect(find.byType(BulletListView), findsNWidgets(3));
      expect(find.text("Stay updated on AI-related conferences worldwide."), findsOneWidget);

      expect(find.text("AI could help solve global challenges like poverty."), findsOneWidget);

      expect(find.byType(InternationalReactionView), findsOneWidget);
      expect(find.text("Excitement"), findsOneWidget);

      expect(find.byType(TimelineView), findsOneWidget);
      expect(find.text("April 19, 2025"), findsOneWidget);

      expect(find.byType(HorizontalCardListView), findsNWidgets(6));
      expect(find.text("Deep Learning"), findsOneWidget);

      expect(find.text("Research"), findsOneWidget);

      expect(find.text("Game"), findsOneWidget);

      expect(find.text("Fast"), findsOneWidget);

      expect(find.text("AI has enormous potential in the business sector."), findsOneWidget);

      expect(find.text("Efficiency"), findsOneWidget);

      expect(find.text("Automotive"), findsNWidgets(2));

      expect(find.text("AI adoption rate: 70%"), findsOneWidget);

      expect(find.text("AI startups leading in venture funding."), findsOneWidget);

      expect(find.text("Learn AI"), findsOneWidget);

      expect(find.byType(ArticlesView), findsOneWidget);
      expect(find.text("AI and the Future of Technology"), findsOneWidget);
    });
  });
}
