import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/views/cached_network_image_view.dart';
import 'package:kagi_news_app/core/views/custom_chip_box.dart';
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
import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsDetailsArgs args;
  const NewsDetailsScreen({required this.args, super.key});

  @override
  Widget build(BuildContext context) {
    final news = args.news;
    final isBookmarked = args.isBookmarked;
    final onBookmarkAdd = args.onBookmarkAdd;
    final onBookmarkRemove = args.onBookmarkRemove;

    final coverImage = news.articles
        ?.where((item) => item.image != null && item.image!.isNotEmpty)
        .toList()
        .firstOrNull;

    final ValueNotifier<bool> bookmarkNotifier =
        ValueNotifier<bool>(isBookmarked);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: bookmarkNotifier,
            builder: (context, isBookmarked, _) => IconButton(
              onPressed: () {
                if (isBookmarked) {
                  onBookmarkRemove();
                  bookmarkNotifier.value = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Bookmark removed successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  onBookmarkAdd();
                  bookmarkNotifier.value = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to bookmark successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              icon: (isBookmarked)
                  ? Icon(Icons.bookmark_added)
                  : Icon(Icons.bookmark_add_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // category & topic
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  if (news.category?.isNotEmpty == true)
                    CustomChipBox(
                      title: news.category ?? "",
                      bgcolor: Colors.red.shade100,
                    ),
                  if (news.location?.isNotEmpty == true)
                    CustomChipBox(
                      title: news.location ?? "",
                      icon: Icon(
                        Icons.location_pin,
                        size: 15,
                      ),
                      bgcolor: Colors.grey.shade300,
                    ),
                ],
              ),
            ),

            // Primary information
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            if (news.shortSummary?.isNotEmpty == true)
              Text(
                news.shortSummary!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

            // Did you know
            if (news.didYouKnow?.isNotEmpty == true)
              DidYouKnowView(text: news.didYouKnow!),

            //Cover photo
            if (coverImage != null)
              CachedNetworkImageView(
                url: coverImage.image,
                caption: coverImage.imageCaption,
                source: coverImage.domain,
              ),

            // Talking Points
            if (news.talkingPoints != null && news.talkingPoints!.isNotEmpty)
              HighlightsView(talkings: news.talkingPoints!),

            // Quote
            if (news.quote?.isNotEmpty == true)
              QuotesView(
                quote: news.quote!,
                author: news.quoteAuthor,
                domain: news.quoteSourceDomain,
                onLaunch: () => _launchUrl(news.quoteSourceUrl, context),
              ),

            // Perspective
            if (news.perspectives?.isNotEmpty == true)
              PerspectiveView(
                perspectives: news.perspectives!,
                onLaunch: (url) => _launchUrl(url, context),
              ),

            // Historical background
            if (news.historicalBackground?.isNotEmpty == true)
              PlainInformationView(
                  title: Strings.historicalBackground,
                  description: news.historicalBackground!),

            // Travel advisory
            if (news.travelAdvisory?.isNotEmpty == true)
              BulletListView(
                  title: Strings.travelAdvisory, items: news.travelAdvisory!),

            // Humanitarian Impact
            if (news.humanitarianImpact?.isNotEmpty == true)
              PlainInformationView(
                  title: Strings.humanitarianImpact,
                  description: news.humanitarianImpact!),

            // International Reactions
            if (news.internationalReactions?.isNotEmpty == true)
              InternationalReactionView(
                  reactions: news.internationalReactions!),

            // Event timeline
            if (news.timeline?.isNotEmpty == true)
              TimelineView(timelines: news.timeline!),

            // Technical details
            if (news.technicalDetails?.isNotEmpty == true)
              HorizontalCardListView(
                  title: Strings.technicalDetails,
                  items: news.technicalDetails!),

            // Scientific Significance
            if (news.scientificSignificance?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.scientificSignificance,
                items: news.scientificSignificance!,
              ),

            // Gameplay mechanics
            if (news.gameplayMechanics?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.gameplayMechanics,
                items: news.gameplayMechanics!,
              ),

            // User experience impact
            if (news.userExperienceImpact?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.userExperienceImpact,
                items: news.userExperienceImpact!,
                showSerial: true,
              ),

            // Business angle
            if (news.businessAngleText?.isNotEmpty == true)
              PlainInformationView(
                title: Strings.businessAngle,
                description: news.businessAngleText!,
              ),

            // Business angle points
            if (news.businessAnglePoints?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.businessAngle,
                items: news.businessAnglePoints!,
              ),

            // Industry impact
            if (news.industryImpact?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.industryImpact,
                items: news.industryImpact!,
                showSerial: true,
              ),

            // Performance Statictics
            if (news.performanceStatistics?.isNotEmpty == true)
              Card(
                elevation: 0,
                color: Pallete.cardBg,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BulletListView(
                    title: Strings.performanceStatistics,
                    items: news.performanceStatistics!,
                  ),
                ),
              ),

            // League standings
            if (news.leagueStandings?.isNotEmpty == true)
              PlainInformationView(
                title: Strings.leagueStandings,
                description: news.leagueStandings!,
              ),

            // User action items
            if (news.userActionItems?.isNotEmpty == true)
              BulletListView(
                  title: Strings.actionItems, items: news.userActionItems!),

            // Related sources
            if (news.articles?.isNotEmpty == true)
              ArticlesView(
                articles: news.articles!,
                domains: news.domains,
                onLaunch: (url) => _launchUrl(url, context),
              )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String? url, BuildContext context) async {
    if (url == null || url.isEmpty) return;

    final uri = Uri.tryParse(url);

    if (uri == null) return;

    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Not found any supported web browser!"),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
