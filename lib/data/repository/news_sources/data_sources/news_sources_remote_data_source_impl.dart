import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';

class NewsSourcesRemoteDataSourceImpl
    implements NewsSourcesRemoteDataSourceDelegate {
  ApiManager apiManager;

  NewsSourcesRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId) async {
    var response = await apiManager.getNewsSourses(categoryId);
    return response;
  }
}
