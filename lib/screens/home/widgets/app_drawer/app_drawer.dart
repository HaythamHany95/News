import 'package:flutter/material.dart';
import 'package:news_app/screens/home/widgets/app_drawer/option_tap.dart';
import 'package:news_app/utils/my_theme.dart';

class AppDrawer extends StatelessWidget {
  static const int optionCategoriesNum = 1;
  static const int optionSettingsNum = 2;

  final Function onDrawerOptionClicked;

  const AppDrawer({required this.onDrawerOptionClicked, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: MyTheme.primaryLightColor,
            alignment: Alignment.center,
            child: Text(
              "News App!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: MyTheme.whiteColor, fontSize: 22),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          DrawerOptionTap(
            onTap: () {
              onDrawerOptionClicked(optionCategoriesNum);
            },
            icon: Icon(
              Icons.category_outlined,
              color: MyTheme.darkGreyColor,
              size: 28,
            ),
            text: Text(
              "Categories",
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
          ),
          DrawerOptionTap(
            onTap: () {
              onDrawerOptionClicked(optionSettingsNum);
            },
            icon: Icon(
              Icons.settings,
              color: MyTheme.darkGreyColor,
              size: 28,
            ),
            text: Text(
              "Settings",
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
