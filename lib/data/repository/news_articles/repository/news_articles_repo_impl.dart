import 'package:news_app/data/models/articles_response.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articles_remote_data_source_delegate.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_delegate.dart';

class NewsArticlesRepositoryImpl implements NewsArticlesRepositoryDelegate {
  NewsArticlesRemoteDataSourceDelegate remoteDelegate;

  NewsArticlesRepositoryImpl({required this.remoteDelegate});

  @override
  Future<ArticlesResponse?> getNewsArticlesBySourceId(String sourceId) {
    return remoteDelegate.getNewsArticlesBySourceId(sourceId);
  }
}
