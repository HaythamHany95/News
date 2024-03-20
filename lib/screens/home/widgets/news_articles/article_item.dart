import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/news_articles/article_item_view.dart';

class ArticleItem extends StatefulWidget {
  final Source sourse;
  const ArticleItem({required this.sourse, super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse?>(
      future: ApiManager.getNewsArticles(widget.sourse.id ?? ""),
      builder: (context, snapshot) {
        /// [future] is not null, but has not yet completed.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );

          ///  When error comes from the client
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
            children: [
              const Text("Something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsArticles(widget.sourse.id ?? "");
                    setState(() {});
                  },
                  child: const Text("Try Again"))
            ],
          ));
        }

        /// Server (error, success)
        if (snapshot.data?.status != 'ok') {
          return Center(
              child: Column(
            children: [
              Text(snapshot.data?.message ?? "UnKonwn Error"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsArticles(widget.sourse.id ?? "");
                    setState(() {});
                  },
                  child: const Text("Try Again"))
            ],
          ));
        }
        var articles = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, i) => ArticleItemView(
            article: articles[i],
          ),
        );
      },
    );
  }
}
