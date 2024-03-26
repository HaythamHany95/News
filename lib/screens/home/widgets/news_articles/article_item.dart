import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/providers/pagination_provider.dart';
import 'package:news_app/screens/article_details/article_details_screen.dart';
import 'package:news_app/screens/home/widgets/news_articles/article_item_view.dart';
import 'package:news_app/utils/my_theme.dart';
import 'package:provider/provider.dart';

class ArticleItem extends StatefulWidget {
  final Source sourse;

  const ArticleItem({required this.sourse, super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  var scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<PaginationProvider>(context, listen: false)
            .changeScrollPositionStatus(true);
      } else {
        Provider.of<PaginationProvider>(context, listen: false)
            .changeScrollPositionStatus(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse?>(
      future: ApiManager.getNewsArticles(
        widget.sourse.id ?? "",
        page: page,
      ),
      builder: (context, snapshot) {
        /// Future is not null, but has not yet completed.
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
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
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
              ),
            ),
            Consumer<PaginationProvider>(
                builder: (BuildContext context, PaginationProvider pageProvider,
                        Widget? child) =>
                    Container(
                      child: (pageProvider.reachEnd)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_left,
                                    color: MyTheme.primaryLightColor),
                                InkWell(
                                  onTap: () {
                                    if (page > 1) {
                                      page--;

                                      ApiManager.getNewsArticles(
                                          widget.sourse.id ?? "",
                                          page: page);
                                      pageProvider
                                          .changeScrollPositionStatus(false);
                                      setState(() {});
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Text(
                                    "Previous Page",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: MyTheme.primaryLightColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (page >= 1) {
                                      page++;

                                      ApiManager.getNewsArticles(
                                          widget.sourse.id ?? "",
                                          page: page);
                                      pageProvider
                                          .changeScrollPositionStatus(false);
                                      setState(() {});
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Text(
                                    "Next Page",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: MyTheme.primaryLightColor),
                                  ),
                                ),
                                Icon(Icons.arrow_right,
                                    color: MyTheme.primaryLightColor),
                              ],
                            )
                          : null,
                    )),
          ],
        );
      },
    );
  }
}
      //  Consumer<PaginationProvider>(
      //         builder: (BuildContext context, PaginationProvider pageProvider,
      //                 Widget? child) =>
      //             Container(
      //           child: (pageProvider.reachEnd)
      //               ? TextButton(
      //                   onPressed: () {
      //                     page++;

      //                     ApiManager.getNewsArticles(widget.sourse.id ?? "",
      //                         page: page);
      //                     pageProvider.changeScrollPositionStatus(false);
      //                     setState(() {});