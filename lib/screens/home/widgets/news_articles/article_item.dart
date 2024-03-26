import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/screens/home/widgets/news_articles/article_item_view.dart';

class ArticleItem extends StatefulWidget {
  final Source sourse;

  const ArticleItem({required this.sourse, super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  ///* Pagination try
  // var scrollController = ScrollController();
  // int page = 1;
  // int pageSize = 5;
  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();

  //   scrollController.addListener(() async {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       setState(() {
  //         isLoading = true;
  //         page++;
  //         pageSize = pageSize + page;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   scrollController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse?>(
      future: ApiManager.getNewsArticles(
        widget.sourse.id ?? "",
        // page: page,
        // pageSize: pageSize,
      ),
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
                    ApiManager.getNewsArticles(
                      widget.sourse.id ?? "",
                      // page: page
                    );
                    setState(() {});
                  },
                  child: const Text("Try Again"))
            ],
          ));
        }
        var articles = snapshot.data?.articles ?? [];
        return ListView.builder(
          // controller: scrollController,
          itemCount: articles.length,
          itemBuilder: (context, i) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
                  arguments: articles[i]);
            },
            child: ArticleItemView(
              article: articles[i],
            ),
          ),
        );
      },
    );
  }
}
