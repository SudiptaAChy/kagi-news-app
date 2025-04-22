import 'package:kagi_news_app/features/news_details/data/models/news_details_args.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/article.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/domain.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/news.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/perspective.dart';
import 'package:kagi_news_app/features/news_list/data/models/news/source.dart';

class MockNewsDetailsDataHelper {
  News news() => News(
        clusterNumber: 1,
        uniqueDomains: 5,
        numberOfTitles: 3,
        category: "Technology",
        title: "AI title",
        shortSummary:
            "AI summary",
        didYouKnow: "AI is now capable of beating humans in chess.",
        talkingPoints: [
          "AI: Artificial Intelligence",
          "ML: Machine Learning",
          "Automation: Automation"
        ],
        quote: "AI will reshape the world.",
        quoteAuthor: "John Doe",
        quoteSourceUrl: "https://example.com/ai-quote",
        quoteSourceDomain: "example.com",
        location: "Silicon Valley",
        perspectives: [
          Perspective(
            text: "AI: AI will revolutionize healthcare.",
            sources: [
              Source(name: "TechCrunch", url: "https://techcrunch.com"),
              Source(name: "Wired", url: "https://wired.com"),
            ],
          ),
        ],
        emoji: "🤖",
        geopoliticalContext: "Global technology race",
        historicalBackground: "AI has been a research topic for decades.",
        internationalReactions: ["US: Excitement", "UK: Fear", "US: Hope"],
        humanitarianImpact:
            "AI could help solve global challenges like poverty.",
        economicImplications:
            "AI will create new jobs but also eliminate many existing ones.",
        timeline: ["April 19, 2025:: AI mainstream", "April 20, 2025:: Full automation in factories"],
        futureOutlook: "AI will continue to evolve, impacting all industries.",
        keyPlayers: [],
        technicalDetails: [
          "DL: Deep Learning",
          "NLP: Natural Language Processing",
          "Robo: Robotics"
        ],
        businessAngleText: "AI has enormous potential in the business sector.",
        businessAnglePoints: [
          "Efficiency: Increased efficiency",
          "Cost: Cost reduction",
          "Business: New business models"
        ],
        userActionItems: ["Learn AI", "Prepare for job market changes"],
        scientificSignificance: [
          "Research: research is advancing rapidly.",
          "Breakthrough: could lead to breakthroughs in science."
        ],
        travelAdvisory: ["Stay updated on AI-related conferences worldwide."],
        destinationHighlights: "AI-powered cities and their potential.",
        culinarySignificance:
            "AI-driven food production could change agriculture.",
        performanceStatistics: [
          "AI's accuracy rate: 95%",
          "AI adoption rate: 70%"
        ],
        leagueStandings: "AI startups leading in venture funding.",
        diyTips: "Explore AI at home with Raspberry Pi.",
        designPrinciples: "AI design should be ethical and inclusive.",
        userExperienceImpact: ["Fast: Faster responses", "Person: Personalized experiences"],
        gameplayMechanics: ["Game: AI-driven gameplay will dominate in video games."],
        industryImpact: ["Automotive: Automotive", "Healthcare: Healthcare", "Finance: Finance"],
        technicalSpecifications: "Requires high computational power.",
        articles: [
          Article(
            title: "AI and the Future of Technology",
            link: "https://example.com/ai-future",
            domain: "example.com",
            date: DateTime.now(),
            image: "https://example.com/ai-image.jpg",
            imageCaption: "AI is the future of tech.",
          ),
        ],
        domains: [
          Domain(name: "example.com", favicon: "https://example.com/favicon.png"),
        ],
      );

  NewsDetailsArgs args() => NewsDetailsArgs(
        news(),
        true,
        () {},
        () {},
      );
}
