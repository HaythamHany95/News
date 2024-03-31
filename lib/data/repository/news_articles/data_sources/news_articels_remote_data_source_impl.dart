import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/models/articles_response.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articles_remote_data_source_delegate.dart';

class NewsArticlesRemoteDataSourceImpl
    implements NewsArticlesRemoteDataSourceDelegate {
  ApiManager apiManager;

  NewsArticlesRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<ArticlesResponse?> getNewsArticlesBySourceId(String sourceId) async {
    var response = await apiManager.getNewsArticles(sourceId);
    return response;
  }
}
