import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articels_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articles_remote_data_source_delegate.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_delegate.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_impl.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_caching_data_source.impl.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_delegate.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_impl.dart';

///* ViewModel => object Repository --------------------------------
NewsSourcesRepositoryDelegate injectNewsSourcesRepositoryDelegate() {
  return NewsSourcesRepositoryImpl(
      remoteDelegate: injectNewsSourcesRemoteDataSourceDelegate(),
      offlineDelegate: injectNewsSourcesChachDataSourceDelegate());
}

NewsArticlesRepositoryDelegate injectNewsArticlesRepositoryDelegate() {
  return NewsArticlesRepositoryImpl(
      remoteDelegate: injectNewsArticlesRemoteDataSourceDelegate());
}

///* Repository => object DataSource --------------------------------
// NewsSources
NewsSourcesRemoteDataSourceDelegate
    injectNewsSourcesRemoteDataSourceDelegate() {
  return NewsSourcesRemoteDataSourceImpl(apiManager: ApiManager.getInstace());
}

// NewsSources
NewsSourcesCachingDataSourceDelegate
    injectNewsSourcesChachDataSourceDelegate() {
  return NewsSourcesCachingDataSourceImpl();
}

// NewsArticles
NewsArticlesRemoteDataSourceDelegate
    injectNewsArticlesRemoteDataSourceDelegate() {
  return NewsArticlesRemoteDataSourceImpl(apiManager: ApiManager.getInstace());
}

///* DataSource => object ApiManager --------------------------------
/// call the singleton
