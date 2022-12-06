import 'package:one_money/data/model/top_headlines.dart';
import 'package:one_money/data/providers/news_provider.dart';

class NewsRepository {
  final newsProvider = NewsProvider();

  Future<TopHeadlines> fetchTopHeadlines({required int page}) async {
    return await newsProvider.fetchTopHeadlines(page: page);
  }
}
