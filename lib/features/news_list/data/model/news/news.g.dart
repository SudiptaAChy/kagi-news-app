// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 3;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      clusterNumber: fields[0] as int?,
      uniqueDomains: fields[1] as int?,
      numberOfTitles: fields[2] as int?,
      category: fields[3] as String?,
      title: fields[4] as String?,
      shortSummary: fields[5] as String?,
      didYouKnow: fields[6] as String?,
      talkingPoints: (fields[7] as List?)?.cast<String>(),
      quote: fields[8] as String?,
      quoteAuthor: fields[9] as String?,
      quoteSourceUrl: fields[10] as String?,
      quoteSourceDomain: fields[11] as String?,
      location: fields[12] as String?,
      perspectives: (fields[13] as List?)?.cast<Perspective>(),
      emoji: fields[14] as String?,
      geopoliticalContext: fields[15] as String?,
      historicalBackground: fields[16] as String?,
      internationalReactions: (fields[17] as List?)?.cast<String>(),
      humanitarianImpact: fields[18] as String?,
      economicImplications: fields[19] as String?,
      timeline: (fields[20] as List?)?.cast<String>(),
      futureOutlook: fields[21] as String?,
      keyPlayers: (fields[22] as List?)?.cast<dynamic>(),
      technicalDetails: (fields[23] as List?)?.cast<String>(),
      businessAngleText: fields[24] as String?,
      businessAnglePoints: (fields[25] as List?)?.cast<String>(),
      userActionItems: (fields[26] as List?)?.cast<String>(),
      scientificSignificance: (fields[27] as List?)?.cast<String>(),
      travelAdvisory: (fields[28] as List?)?.cast<String>(),
      destinationHighlights: fields[29] as String?,
      culinarySignificance: fields[30] as String?,
      performanceStatistics: (fields[31] as List?)?.cast<String>(),
      leagueStandings: fields[32] as String?,
      diyTips: fields[33] as String?,
      designPrinciples: fields[34] as String?,
      userExperienceImpact: (fields[35] as List?)?.cast<String>(),
      gameplayMechanics: (fields[36] as List?)?.cast<String>(),
      industryImpact: (fields[37] as List?)?.cast<String>(),
      technicalSpecifications: fields[38] as String?,
      articles: (fields[39] as List?)?.cast<Article>(),
      domains: (fields[40] as List?)?.cast<Domain>(),
    )..uid = fields[41] as String;
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(42)
      ..writeByte(0)
      ..write(obj.clusterNumber)
      ..writeByte(1)
      ..write(obj.uniqueDomains)
      ..writeByte(2)
      ..write(obj.numberOfTitles)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.shortSummary)
      ..writeByte(6)
      ..write(obj.didYouKnow)
      ..writeByte(7)
      ..write(obj.talkingPoints)
      ..writeByte(8)
      ..write(obj.quote)
      ..writeByte(9)
      ..write(obj.quoteAuthor)
      ..writeByte(10)
      ..write(obj.quoteSourceUrl)
      ..writeByte(11)
      ..write(obj.quoteSourceDomain)
      ..writeByte(12)
      ..write(obj.location)
      ..writeByte(13)
      ..write(obj.perspectives)
      ..writeByte(14)
      ..write(obj.emoji)
      ..writeByte(15)
      ..write(obj.geopoliticalContext)
      ..writeByte(16)
      ..write(obj.historicalBackground)
      ..writeByte(17)
      ..write(obj.internationalReactions)
      ..writeByte(18)
      ..write(obj.humanitarianImpact)
      ..writeByte(19)
      ..write(obj.economicImplications)
      ..writeByte(20)
      ..write(obj.timeline)
      ..writeByte(21)
      ..write(obj.futureOutlook)
      ..writeByte(22)
      ..write(obj.keyPlayers)
      ..writeByte(23)
      ..write(obj.technicalDetails)
      ..writeByte(24)
      ..write(obj.businessAngleText)
      ..writeByte(25)
      ..write(obj.businessAnglePoints)
      ..writeByte(26)
      ..write(obj.userActionItems)
      ..writeByte(27)
      ..write(obj.scientificSignificance)
      ..writeByte(28)
      ..write(obj.travelAdvisory)
      ..writeByte(29)
      ..write(obj.destinationHighlights)
      ..writeByte(30)
      ..write(obj.culinarySignificance)
      ..writeByte(31)
      ..write(obj.performanceStatistics)
      ..writeByte(32)
      ..write(obj.leagueStandings)
      ..writeByte(33)
      ..write(obj.diyTips)
      ..writeByte(34)
      ..write(obj.designPrinciples)
      ..writeByte(35)
      ..write(obj.userExperienceImpact)
      ..writeByte(36)
      ..write(obj.gameplayMechanics)
      ..writeByte(37)
      ..write(obj.industryImpact)
      ..writeByte(38)
      ..write(obj.technicalSpecifications)
      ..writeByte(39)
      ..write(obj.articles)
      ..writeByte(40)
      ..write(obj.domains)
      ..writeByte(41)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
