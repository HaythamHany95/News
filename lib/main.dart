import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/business_logic/providers/pagination_provider.dart';
import 'package:news_app/presentation/screens/article_details/article_details_screen.dart';
import 'package:news_app/presentation/screens/home/home_body_contents/search_article.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/utils/my_theme.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PaginationProvider())
  ], child: const MyApp()));
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
      theme: MyTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ArticleDetailsScreen.routeName: (context) =>
            const ArticleDetailsScreen(),
        SearchArticle.routeName: (context) => const SearchArticle()
      },
    );
  }
}
