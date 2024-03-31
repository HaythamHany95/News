import 'package:news_app/data/models/articles_response.dart';

abstract class NewsArticlesRepositoryDelegate {
  Future<ArticlesResponse?> getNewsArticlesBySourceId(String sourceId);
}
