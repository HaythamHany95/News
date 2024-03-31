import 'package:news_app/data/models/sources_response.dart';

abstract class NewsSourcesRepositoryDelegate {
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId);
}
