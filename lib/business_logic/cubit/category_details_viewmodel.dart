import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/business_logic/cubit/states/source_states.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_data_sourcs_delegates.dart';
import 'package:news_app/data/repository/news_sources/data_sources/news_sources_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_delegate.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_impl.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  late NewsSourcesRepositoryDelegate newsSourcesRepositoryDelegate;

  /// ToDo : Inject Those Dependecies
  late NewsSourcesRemoteDataSourceDelegate remoteDataSourceDelegate;
  ApiManager apiManager = ApiManager();

  CategoryDetailsViewModel() : super(SourceLoadingState()) {
    remoteDataSourceDelegate =
        NewsSourcesRemoteDataSourceImpl(apiManager: apiManager);
    newsSourcesRepositoryDelegate =
        NewsSourcesRepositoryImpl(remoteDelegate: remoteDataSourceDelegate);
  }

  void getNewsSoursesByCategoryId(String categoryId) async {
    emit(SourceLoadingState());
    try {
      var respose = await newsSourcesRepositoryDelegate
          .getNewsSourcesByCategoryId(categoryId);
      if (respose?.status == 'error') {
        emit(SourceErrorState(errorMessage: respose?.message));
      }
      if (respose?.status == 'ok') {
        emit(SourceSuccessState(sources: respose?.sources));
      }
    } catch (error) {
      emit(SourceErrorState(errorMessage: "Something went wrong"));
    }
  }
}
