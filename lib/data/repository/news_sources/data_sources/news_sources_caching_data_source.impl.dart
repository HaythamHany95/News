import 'package:hive/hive.dart';
import 'package:news_app/data/models/sources_response.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';

class NewsSourcesCachingDataSourceImpl
    implements NewsSourcesCachingDataSourceDelegate {
  @override
  void cachNewsSources(SourcesResponse? sourcesResponse) async {
    var box = await Hive.openBox('news_sources');
    await box.put('source', sourcesResponse?.toJson());
    box.close();
  }

  @override
  Future<SourcesResponse?> getNewsSourcesByCategoryId(String categoryId) async {
    var box = await Hive.openBox('news_sources');
    var response = SourcesResponse.fromJson(box.get('source'));
    return response;
  }
}
