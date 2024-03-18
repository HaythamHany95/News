import 'package:flutter/material.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/screen/categories/widgets/sourses_tab.dart';
import 'package:news_app/utils/my_theme.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'category_screen';

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,

          ///TODOO: child: pattern of the 'news_app'
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getNewsSourses(),
              builder: (context, snapshot) {
                ///
                /// 1) [future] is not null, but has not yet completed.
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.primaryLightColor,
                    ),
                  );

                  /// 2) When error comes from the client
                } else if (snapshot.hasError) {
                  return Center(
                      child: Column(
                    children: [
                      const Text("Something went wrong"),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsSourses();
                            setState(() {});
                          },
                          child: const Text("Try Again"))
                    ],
                  ));
                }

                /// 3) Server (error, success)
                /// error

                if (snapshot.data?.status != 'ok') {
                  return Center(
                      child: Column(
                    children: [
                      Text(snapshot.data?.message ?? "UnKonwn Error"),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsSourses();
                            setState(() {});
                          },
                          child: const Text("Try Again"))
                    ],
                  ));
                }
                var sources = snapshot.data?.sources ?? [];
                return SoursesTab(sources: sources);
                // itemBuilder: (context, i) => Text(sources?[i].name ?? ""));
              }),
        )
      ],
    );
  }
}
