import 'package:flutter/material.dart';
import 'package:news_app/utils/my_theme.dart';

class NewsCategory {
  String? id, title, imagePath;
  Color? color;

  NewsCategory(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<NewsCategory> getNewsCategories() {
    return [
      NewsCategory(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          color: MyTheme.redcolor),
      NewsCategory(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: MyTheme.darkBlueColor),
      NewsCategory(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      NewsCategory(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: MyTheme.brownColor),
      NewsCategory(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: MyTheme.blueColor),
    ];
  }
}
