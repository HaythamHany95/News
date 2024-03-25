import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/screens/home/widgets/news_articles/article_item_view.dart';
import 'package:news_app/screens/home/widgets/search_appbar/appbar_search_field.dart';

class SearchArticle extends StatefulWidget {
  static const String routeName = 'search_article';

  const SearchArticle({super.key});

  @override
  State<SearchArticle> createState() => _SearchArticleState();
}

class _SearchArticleState extends State<SearchArticle> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Image.asset('assets/images/pattern.png'),
      ),
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: MediaQuery.of(context).size.height * 0.04,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: AppBarSearchField(
            controller: controller,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<ArticlesResponse?>(
            future: ApiManager.getSearchedNewsArticles(controller.text),
            builder: (context, snapshot) {
              var articles = snapshot.data?.articles ?? [];
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, i) => InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ArticleDetailsScreen.routeName,
                        arguments: articles[i]),
                    child: ArticleItemView(article: articles[i])),
              );
            }),
      )
    ]);
  }
}
