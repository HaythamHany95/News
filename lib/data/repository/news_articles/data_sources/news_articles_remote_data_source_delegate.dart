import 'package:news_app/data/models/articles_response.dart';

abstract class NewsArticlesRemoteDataSourceDelegate {
  Future<ArticlesResponse?> getNewsArticlesBySourceId(String sourceId);
}
