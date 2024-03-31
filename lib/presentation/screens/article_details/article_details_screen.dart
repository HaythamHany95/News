import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles_response.dart';
import 'package:news_app/presentation/widgets/news_articles/article_item_view.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routeName = 'article_details_screen';

  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var articleArgs = ModalRoute.of(context)?.settings.arguments as Article;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset('assets/images/pattern.png'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              maxLines: 3,
              articleArgs.title ?? "",
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          ),
          body: ArticleItemView(
            article: articleArgs,
            articleContent: articleArgs.description! + articleArgs.content!,
          ),
        )
      ],
    );
  }
}
