import 'package:flutter/material.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/screens/home/widgets/news_categories/category_item_view.dart';

class CategoryFragments extends StatelessWidget {
  final Function onCategoryClicked;

  const CategoryFragments({required this.onCategoryClicked, super.key});

  @override
  Widget build(BuildContext context) {
    var newsCategories = NewsCategory.getNewsCategories();

    return Container(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 1.1 / 1.2),
                  itemCount: newsCategories.length,
                  itemBuilder: (context, i) => InkWell(
                        onTap: () {
                          onCategoryClicked(newsCategories[i]);
                        },
                        child: CategoryItemView(
                          category: newsCategories[i],
                          index: i,
                        ),
                      )))
        ],
      ),
    );
  }
}
