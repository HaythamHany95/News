import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_delegate.dart';

class NewsSourcesRepositoryImpl implements NewsSourcesRepositoryDelegate {
  NewsSourcesRemoteDataSourceDelegate remoteDelegate;
  NewsSourcesCachingDataSourceDelegate offlineDelegate;

  NewsSourcesRepositoryImpl(
      {required this.remoteDelegate, required this.offlineDelegate});

  @override
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      var newsSourcesResponse =
          await remoteDelegate.getNewsSourcesByCategoryId(categoryId);
      offlineDelegate.cachNewsSources(newsSourcesResponse);
      return newsSourcesResponse;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      var newsSourcesResponse =
          await remoteDelegate.getNewsSourcesByCategoryId(categoryId);
      offlineDelegate.cachNewsSources(newsSourcesResponse);
      return newsSourcesResponse;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      var response =
          await offlineDelegate.getNewsSourcesByCategoryId(categoryId);
      return response;
    }
    return null;
  }
}
