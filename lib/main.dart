import 'package:flutter/material.dart';
import 'package:news_app/screen/category_screen.dart';
import 'package:news_app/utils/my_theme.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: CategoryScreen.routeName,
      theme: MyTheme.lightTheme,
      routes: {
        CategoryScreen.routeName: (context) => const CategoryScreen(),
      },
    );
  }
}