import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/business_logic/cubit/states/article_states.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articels_remote_data_source_impl.dart';
import 'package:news_app/data/repository/news_articles/data_sources/news_articles_remote_data_source_delegate.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_delegate.dart';
import 'package:news_app/data/repository/news_articles/repository/news_articles_repo_impl.dart';

class ArticleItemViewModel extends Cubit<ArticleStates> {
  late NewsArticlesRepositoryDelegate repoDelegate;

  /// ToDo : Inject those dependencies
  ApiManager apiManager = ApiManager();
  late NewsArticlesRemoteDataSourceDelegate remoteDelegate;

  ArticleItemViewModel() : super(ArticleLoadingState()) {
    remoteDelegate = NewsArticlesRemoteDataSourceImpl(apiManager: apiManager);
    repoDelegate = NewsArticlesRepositoryImpl(remoteDelegate: remoteDelegate);
  }

  void getNewsArticlesBySourceId(String? sourceId) async {
    emit(ArticleLoadingState());
    try {
      var respose =
          await repoDelegate.getNewsArticlesBySourceId(sourceId ?? "");
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
