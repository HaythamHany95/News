import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/states/article_states.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_delegate.dart';

class ArticleItemViewModel extends Cubit<ArticleStates> {
  ///
  NewsArticlesRepositoryDelegate repoDelegate;

  ///// ToDo : Inject those dependencies
  // ApiManager apiManager = ApiManager();
  // late NewsArticlesRemoteDataSourceDelegate remoteDelegate;

  ArticleItemViewModel({required this.repoDelegate})
      : super(ArticleLoadingState());

  void getNewsArticlesBySourceId(String? sourceId) async {
    emit(ArticleLoadingState());
    try {
      var response =
          await repoDelegate.getNewsArticlesBySourceId(sourceId ?? "");
      if (response?.status == 'error') {
        emit(ArticleErrorState(errorMessage: response?.message));
      }
      if (response?.status == 'ok') {
        emit(ArticleSuccessState(articles: response?.articles ?? []));
      }
    } catch (e) {
      emit(ArticleErrorState(errorMessage: "Something went wrong"));
    }
  }
}
