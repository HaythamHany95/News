import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItemView extends StatelessWidget {
  final Article? article;

  const ArticleItemView({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    String? date = article?.publishedAt;
    DateTime datePublished = DateTime.parse(date ?? "");

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
          )
        ],
      ),
    );
  }
}
