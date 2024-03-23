import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/news_sourses/sourses_tab_bar.dart';

/// Localization_import
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDetails extends StatefulWidget {
  final NewsCategory category;

  const CategoryDetails({required this.category, super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse?>(
        future: ApiManager.getNewsSourses(widget.category.id ?? ""),
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
                      ApiManager.getNewsSourses(widget.category?.id ?? "");
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            ));
          }

          /// 3) Server (error, success)

          if (snapshot.data?.status != 'ok') {
            return Center(
                child: Column(
              children: [
                Text(snapshot.data?.message ?? "UnKonwn Error"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsSourses(widget.category.id ?? "");
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            ));
          }
          var sources = snapshot.data?.sources ?? [];
          return SoursesTabBar(sources: sources);
          // itemBuilder: (context, i) => Text(sources?[i].name ?? ""));
        });
  }
}
