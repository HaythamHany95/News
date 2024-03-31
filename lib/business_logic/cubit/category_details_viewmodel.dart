import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/states/source_states.dart';
import 'package:news_app/data/repository/news_sources/repository/news_sources_repo_delegate.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  ///
  NewsSourcesRepositoryDelegate repoDelegate;

  ///// ToDo : Inject Those Dependecies
  // late NewsSourcesRemoteDataSourceDelegate remoteDelegate;
  // ApiManager apiManager = ApiManager();

  CategoryDetailsViewModel({required this.repoDelegate})
      : super(SourceLoadingState());

  void getNewsSoursesByCategoryId(String categoryId) async {
    emit(SourceLoadingState());
    try {
      var respose = await repoDelegate.getNewsSourcesByCategoryId(categoryId);
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
