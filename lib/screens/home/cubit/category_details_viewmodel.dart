import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/screens/home/states/source_states.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getNewsSoursesByCategoryId(String categoryId) async {
    emit(SourceLoadingState());
    try {
      var respose = await ApiManager.getNewsSourses(categoryId);
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
