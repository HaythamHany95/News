import 'package:news_app/models/articles_response.dart';

abstract class ArticleStates {}

class ArticleLoadingState extends ArticleStates {}

class ArticleErrorState extends ArticleStates {
  String? errorMessage;
  ArticleErrorState({required this.errorMessage});
}

class ArticleSuccessState extends ArticleStates {
  List<Article>? articles;
  ArticleSuccessState({required this.articles});
}
