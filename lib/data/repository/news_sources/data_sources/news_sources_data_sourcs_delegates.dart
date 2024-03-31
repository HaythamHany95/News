import 'package:news_app/data/models/sources_response.dart';

abstract class NewsSourcesRemoteDataSourceDelegate {
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId);
}

abstract class NewsSourcesCachingDataSourceDelegate {}
