import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kagi_news_app/core/constants/pallete.dart';
import 'package:kagi_news_app/core/constants/strings.dart';
import 'package:kagi_news_app/core/views/cached_network_image_view.dart';
import 'package:kagi_news_app/core/views/custom_chip_box.dart';
import 'package:kagi_news_app/features/news_details/components/articles_view.dart';
import 'package:kagi_news_app/features/news_details/components/bullet_list_view.dart';
import 'package:kagi_news_app/features/news_details/components/did_you_know_view.dart';
import 'package:kagi_news_app/features/news_details/components/highlights_view.dart';
import 'package:kagi_news_app/features/news_details/components/horizontal_card_list_view.dart';
import 'package:kagi_news_app/features/news_details/components/international_reaction_view.dart';
import 'package:kagi_news_app/features/news_details/components/perspective_view.dart';
import 'package:kagi_news_app/features/news_details/components/plain_information_view.dart';
import 'package:kagi_news_app/features/news_details/components/quotes_view.dart';
import 'package:kagi_news_app/features/news_details/components/timeline_view.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatefulWidget {
  final News news;
  const NewsDetailsScreen({required this.news, super.key});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final coverImage = widget.news.articles
        ?.where((item) => item.image != null && item.image!.isNotEmpty)
        .toList()
        .firstOrNull;

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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_add_outlined),
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
                  if (widget.news.category?.isNotEmpty == true)
                    CustomChipBox(
                      title: widget.news.category ?? "",
                      bgcolor: Colors.red.shade100,
                    ),
                  if (widget.news.location?.isNotEmpty == true)
                    CustomChipBox(
                      title: widget.news.location ?? "",
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
              widget.news.title ?? "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              widget.news.shortSummary ?? "",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            // Did you know
            if (widget.news.didYouKnow != null)
              DidYouKnowView(text: widget.news.didYouKnow!),

            //Cover photo
            if (coverImage != null)
              CachedNetworkImageView(
                url: coverImage.image,
                caption: coverImage.imageCaption,
                source: coverImage.domain,
              ),

            // Talking Points
            if (widget.news.talkingPoints != null &&
                widget.news.talkingPoints!.isNotEmpty)
              HighlightsView(talkings: widget.news.talkingPoints!),

            // Quote
            if (widget.news.quote != null)
              QuotesView(
                quote: widget.news.quote!,
                author: widget.news.quoteAuthor,
                domain: widget.news.quoteSourceDomain,
                onLaunch: () => _launchUrl(widget.news.quoteSourceUrl, context),
              ),

            // Perspective
            if (widget.news.perspectives?.isNotEmpty == true)
              PerspectiveView(
                perspectives: widget.news.perspectives!,
                onLaunch: (url) => _launchUrl(url, context),
              ),

            // Historical background
            if (widget.news.historicalBackground?.isNotEmpty == true)
              PlainInformationView(
                  title: Strings.historicalBackground,
                  description: widget.news.historicalBackground!),

            // Travel advisory
            if (widget.news.travelAdvisory?.isNotEmpty == true)
              BulletListView(
                  title: Strings.travelAdvisory,
                  items: widget.news.travelAdvisory!),

            // Humanitarian Impact
            if (widget.news.humanitarianImpact?.isNotEmpty == true)
              PlainInformationView(
                  title: Strings.humanitarianImpact,
                  description: widget.news.humanitarianImpact!),

            // International Reactions
            if (widget.news.internationalReactions?.isNotEmpty == true)
              InternationalReactionView(
                  reactions: widget.news.internationalReactions!),

            // Event timeline
            if (widget.news.timeline?.isNotEmpty == true)
              TimelineView(timelines: widget.news.timeline!),

            // Technical details
            if (widget.news.technicalDetails?.isNotEmpty == true)
              HorizontalCardListView(
                  title: Strings.technicalDetails,
                  items: widget.news.technicalDetails!),

            // Scientific Significance
            if (widget.news.scientificSignificance?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.scientificSignificance,
                items: widget.news.scientificSignificance!,
              ),

            // Gameplay mechanics
            if (widget.news.gameplayMechanics?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.gameplayMechanics,
                items: widget.news.gameplayMechanics!,
              ),

            // User experience impact
            if (widget.news.userExperienceImpact?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.userExperienceImpact,
                items: widget.news.userExperienceImpact!,
                showSerial: true,
              ),

            // Business angle
            if (widget.news.businessAngleText?.isNotEmpty == true)
              PlainInformationView(
                title: Strings.businessAngle,
                description: widget.news.businessAngleText!,
              ),

            // Business angle points
            if (widget.news.businessAnglePoints?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.businessAngle,
                items: widget.news.businessAnglePoints!,
              ),

            // Industry impact
            if (widget.news.industryImpact?.isNotEmpty == true)
              HorizontalCardListView(
                title: Strings.industryImpact,
                items: widget.news.industryImpact!,
                showSerial: true,
              ),

            // Performance Statictics
            if (widget.news.performanceStatistics?.isNotEmpty == true)
              Card(
                elevation: 0,
                color: Pallete.cardBg,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BulletListView(
                    title: Strings.performanceStatistics,
                    items: widget.news.performanceStatistics!,
                  ),
                ),
              ),

            // League standings
            if (widget.news.leagueStandings?.isNotEmpty == true)
              PlainInformationView(
                title: Strings.leagueStandings,
                description: widget.news.leagueStandings!,
              ),

            // User action items
            if (widget.news.userActionItems?.isNotEmpty == true)
              BulletListView(
                  title: Strings.actionItems,
                  items: widget.news.userActionItems!),

            // Related sources
            if (widget.news.articles?.isNotEmpty == true)
              ArticlesView(
                articles: widget.news.articles!,
                domains: widget.news.domains,
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
