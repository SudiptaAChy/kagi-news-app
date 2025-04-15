import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/perspective.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/article.dart';
import 'package:kagi_news_app/features/news_list/data/model/news/domain.dart';

part 'news.g.dart';

@HiveType(typeId: 3)
class News extends HiveObject {
  @HiveField(0)
  int? clusterNumber;

  @HiveField(1)
  int? uniqueDomains;

  @HiveField(2)
  int? numberOfTitles;

  @HiveField(3)
  String? category;

  @HiveField(4)
  String? title;

  @HiveField(5)
  String? shortSummary;

  @HiveField(6)
  String? didYouKnow;

  @HiveField(7)
  List<String>? talkingPoints;

  @HiveField(8)
  String? quote;

  @HiveField(9)
  String? quoteAuthor;

  @HiveField(10)
  String? quoteSourceUrl;

  @HiveField(11)
  String? quoteSourceDomain;

  @HiveField(12)
  String? location;

  @HiveField(13)
  List<Perspective>? perspectives;

  @HiveField(14)
  String? emoji;

  @HiveField(15)
  String? geopoliticalContext;

  @HiveField(16)
  String? historicalBackground;

  @HiveField(17)
  List<String>? internationalReactions;

  @HiveField(18)
  String? humanitarianImpact;

  @HiveField(19)
  String? economicImplications;

  @HiveField(20)
  List<String>? timeline;

  @HiveField(21)
  String? futureOutlook;

  @HiveField(22)
  List<dynamic>? keyPlayers;

  @HiveField(23)
  List<String>? technicalDetails;

  @HiveField(24)
  String? businessAngleText;

  @HiveField(25)
  List<String>? businessAnglePoints;

  @HiveField(26)
  List<String>? userActionItems;

  @HiveField(27)
  List<String>? scientificSignificance;

  @HiveField(28)
  List<String>? travelAdvisory;

  @HiveField(29)
  String? destinationHighlights;

  @HiveField(30)
  String? culinarySignificance;

  @HiveField(31)
  List<String>? performanceStatistics;

  @HiveField(32)
  String? leagueStandings;

  @HiveField(33)
  String? diyTips;

  @HiveField(34)
  String? designPrinciples;

  @HiveField(35)
  List<String>? userExperienceImpact;

  @HiveField(36)
  List<String>? gameplayMechanics;

  @HiveField(37)
  List<String>? industryImpact;

  @HiveField(38)
  String? technicalSpecifications;

  @HiveField(39)
  List<Article>? articles;

  @HiveField(40)
  List<Domain>? domains;

  News({
    this.clusterNumber,
    this.uniqueDomains,
    this.numberOfTitles,
    this.category,
    this.title,
    this.shortSummary,
    this.didYouKnow,
    this.talkingPoints,
    this.quote,
    this.quoteAuthor,
    this.quoteSourceUrl,
    this.quoteSourceDomain,
    this.location,
    this.perspectives,
    this.emoji,
    this.geopoliticalContext,
    this.historicalBackground,
    this.internationalReactions,
    this.humanitarianImpact,
    this.economicImplications,
    this.timeline,
    this.futureOutlook,
    this.keyPlayers,
    this.technicalDetails,
    this.businessAngleText,
    this.businessAnglePoints,
    this.userActionItems,
    this.scientificSignificance,
    this.travelAdvisory,
    this.destinationHighlights,
    this.culinarySignificance,
    this.performanceStatistics,
    this.leagueStandings,
    this.diyTips,
    this.designPrinciples,
    this.userExperienceImpact,
    this.gameplayMechanics,
    this.industryImpact,
    this.technicalSpecifications,
    this.articles,
    this.domains,
  });

  factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory News.fromJson(Map<String, dynamic> json) => News(
    clusterNumber: json["cluster_number"],
    uniqueDomains: json["unique_domains"],
    numberOfTitles: json["number_of_titles"],
    category: json["category"],
    title: json["title"],
    shortSummary: json["short_summary"],
    didYouKnow: json["did_you_know"],
    talkingPoints: json["talking_points"] == null ? [] : List<String>.from(json["talking_points"]!.map((x) => x)),
    quote: json["quote"],
    quoteAuthor: json["quote_author"],
    quoteSourceUrl: json["quote_source_url"],
    quoteSourceDomain: json["quote_source_domain"],
    location: json["location"],
    perspectives: json["perspectives"] == null ? [] : List<Perspective>.from(json["perspectives"]!.map((x) => Perspective.fromJson(x))),
    emoji: json["emoji"],
    geopoliticalContext: json["geopolitical_context"],
    historicalBackground: json["historical_background"],
    internationalReactions: parseStringList(json["international_reactions"]),
    humanitarianImpact: json["humanitarian_impact"],
    economicImplications: json["economic_implications"],
    timeline: parseStringList(json["timeline"]),
    futureOutlook: json["future_outlook"],
    keyPlayers: json["key_players"] == null ? [] : List<dynamic>.from(json["key_players"]!.map((x) => x)),
    technicalDetails: parseStringList(json["technical_details"]),
    businessAngleText: json["business_angle_text"],
    businessAnglePoints: json["business_angle_points"] == null ? [] : List<String>.from(json["business_angle_points"]!.map((x) => x)),
    userActionItems: parseStringList(json["user_action_items"]),
    scientificSignificance: json["scientific_significance"] == null ? [] : List<String>.from(json["scientific_significance"]!.map((x) => x)),
    travelAdvisory: parseStringList(json["travel_advisory"]),
    destinationHighlights: json["destination_highlights"],
    culinarySignificance: json["culinary_significance"],
    performanceStatistics: parseStringList(json["performance_statistics"]),
    leagueStandings: json["league_standings"],
    diyTips: json["diy_tips"],
    designPrinciples: json["design_principles"],
    userExperienceImpact: parseStringList(json["user_experience_impact"]),
    gameplayMechanics: parseStringList(json["gameplay_mechanics"]),
    industryImpact: json["industry_impact"] == null ? [] : List<String>.from(json["industry_impact"]!.map((x) => x)),
    technicalSpecifications: json["technical_specifications"],
    articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    domains: json["domains"] == null ? [] : List<Domain>.from(json["domains"]!.map((x) => Domain.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cluster_number": clusterNumber,
    "unique_domains": uniqueDomains,
    "number_of_titles": numberOfTitles,
    "category": category,
    "title": title,
    "short_summary": shortSummary,
    "did_you_know": didYouKnow,
    "talking_points": talkingPoints == null ? [] : List<dynamic>.from(talkingPoints!.map((x) => x)),
    "quote": quote,
    "quote_author": quoteAuthor,
    "quote_source_url": quoteSourceUrl,
    "quote_source_domain": quoteSourceDomain,
    "location": location,
    "perspectives": perspectives == null ? [] : List<dynamic>.from(perspectives!.map((x) => x.toJson())),
    "emoji": emoji,
    "geopolitical_context": geopoliticalContext,
    "historical_background": historicalBackground,
    "international_reactions": internationalReactions,
    "humanitarian_impact": humanitarianImpact,
    "economic_implications": economicImplications,
    "timeline": timeline,
    "future_outlook": futureOutlook,
    "key_players": keyPlayers == null ? [] : List<dynamic>.from(keyPlayers!.map((x) => x)),
    "technical_details": technicalDetails,
    "business_angle_text": businessAngleText,
    "business_angle_points": businessAnglePoints == null ? [] : List<dynamic>.from(businessAnglePoints!.map((x) => x)),
    "user_action_items": userActionItems,
    "scientific_significance": scientificSignificance == null ? [] : List<dynamic>.from(scientificSignificance!.map((x) => x)),
    "travel_advisory": travelAdvisory == null ? [] : List<dynamic>.from(travelAdvisory!.map((x) => x)),
    "destination_highlights": destinationHighlights,
    "culinary_significance": culinarySignificance,
    "performance_statistics": performanceStatistics == null ? [] : List<dynamic>.from(performanceStatistics!.map((x) => x)),
    "league_standings": leagueStandings,
    "diy_tips": diyTips,
    "design_principles": designPrinciples,
    "user_experience_impact": userExperienceImpact,
    "gameplay_mechanics": gameplayMechanics == null ? [] : List<dynamic>.from(gameplayMechanics!.map((x) => x)),
    "industry_impact": industryImpact == null ? [] : List<dynamic>.from(industryImpact!.map((x) => x)),
    "technical_specifications": technicalSpecifications,
    "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
    "domains": domains == null ? [] : List<dynamic>.from(domains!.map((x) => x.toJson())),
  };
}

List<String>? parseStringList(dynamic value) {
  if (value == null) return [];

  if (value is List) {
    return List<String>.from(value);
  }

  return [];
}

