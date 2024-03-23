import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/utils/my_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ArticleItemView extends StatelessWidget {
  final Article? article;
  final String? articleContent;

  const ArticleItemView(
      {this.articleContent, required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    String? date = article?.publishedAt;
    DateTime datePublished = DateTime.parse(date ?? "");
    Size size = MediaQuery.of(context).size;

    // Future<void> _launchUrl(String url) async {
    //   final Uri uri = Uri.parse(url);
    //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //     throw Exception('Could not launch');
    //   }
    // }

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: article?.urlToImage ?? "",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article?.author ?? "",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            article?.title ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                timeago.format(datePublished),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          (articleContent != null)
              ? Container(
                  padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                  decoration: BoxDecoration(
                      color: MyTheme.whiteColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 10,
                        articleContent ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          // _launchUrl(article?.url ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View Full Article",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: MyTheme.blackColor),
                            ),
                            const Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
