import 'package:flutter/material.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/utils/my_theme.dart';

class CategoryItemView extends StatelessWidget {
  final NewsCategory category;
  final int index;

  const CategoryItemView(
      {required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: (index % 2 == 0)
              ? const Radius.circular(20)
              : const Radius.circular(0),
          bottomRight: (index % 2 == 0)
              ? const Radius.circular(0)
              : const Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath ?? "",
            height: size.height * 0.15,
          ),
          Text(
            category.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
