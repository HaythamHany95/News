import 'package:flutter/material.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/screens/categories/widgets/category_item_view.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'categories_screen';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var newsCategories = NewsCategory.getNewsCategories();

    return Stack(children: [
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
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(top: 30, right: 30, left: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pick your category \n of interest",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              childAspectRatio: 1.1 / 1.2),
                      itemCount: newsCategories.length,
                      itemBuilder: (context, i) => CategoryItemView(
                            category: newsCategories[i],
                            index: i,
                          )))
            ],
          ),
        ),
      )
    ]);
  }
}
