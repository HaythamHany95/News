import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_delegate.dart';

class NewsSourcesRepositoryImpl implements NewsSourcesRepositoryDelegate {
  NewsSourcesRemoteDataSourceDelegate remoteDelegate;

  NewsSourcesRepositoryImpl({required this.remoteDelegate});

  @override
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId) {
    return remoteDelegate.getNewsSourcesByCategoryId(categoryId);
  }
}
