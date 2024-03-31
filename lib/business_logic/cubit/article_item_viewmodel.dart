import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/business_logic/cubit/states/article_states.dart';

class ArticleItemViewModel extends Cubit<ArticleStates> {
  ArticleItemViewModel() : super(ArticleLoadingState());
  void getNewsArticlesBySourceId(String? sourceId) async {
    emit(ArticleLoadingState());
    try {
      var respose = await ApiManager.getNewsArticles(sourceId ?? "");
      if (respose?.status == 'error') {
        emit(ArticleErrorState(errorMessage: respose?.message));
      }
      if (respose?.status == 'ok') {
        emit(ArticleSuccessState(articles: respose?.articles ?? []));
      }
    } catch (e) {
      emit(ArticleErrorState(errorMessage: "Something went wrong"));
    }
  }
}
