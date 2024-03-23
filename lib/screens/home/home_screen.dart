import 'package:flutter/material.dart';
import 'package:news_app/models/news_category.dart';
import 'package:news_app/screens/home/home_body_contents/categories_fragments.dart';
import 'package:news_app/screens/home/home_body_contents/category_details.dart';
import 'package:news_app/screens/home/home_body_contents/settings_tab.dart';
import 'package:news_app/screens/home/widgets/app_drawer/app_drawer.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// MARK : [ Variables ]
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  NewsCategory? selectedCategory;
  int? selectedDrawerOption = AppDrawer.optionCategoriesNum;

  /// MARK : [ Utilities ]
  void onCategoryItemClicked(NewsCategory newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerOptionClicked(int newSelectedDrawerOption) {
    selectedDrawerOption = newSelectedDrawerOption;
    selectedCategory = null;
    setState(() {});
    Navigator.pop(context);
  }

  /// MARK : [ StfLifeCycle ]
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset('assets/images/pattern.png'),
        ),
        Scaffold(
          key: _scaffoldkey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: (selectedDrawerOption == AppDrawer.optionSettingsNum)
                  ? const Text("Settings")
                  : (selectedCategory == null)
                      ? Text(
                          AppLocalizations.of(context)!.app_title,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      : Text(selectedCategory?.title ?? ""),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage('assets/images/search_icon.png'),
                      size: 40,
                    )),
                const SizedBox(
                  width: 30,
                ),
              ],
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              leadingWidth: 90,
              leading: IconButton(
                onPressed: () {
                  _scaffoldkey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu_rounded,
                  size: 40,
                ),
              )),
          drawer: AppDrawer(
            onDrawerOptionClicked: onDrawerOptionClicked,
          ),
          body: (selectedDrawerOption == AppDrawer.optionSettingsNum)
              ? const SettingsTab()
              : (selectedCategory == null)
                  ? CategoryFragments(onCategoryClicked: onCategoryItemClicked)
                  : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }
}
