import 'package:flutter/material.dart';

/// Localization_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/news_sourses/sourses_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: FutureBuilder<SourcesResponse?>(
              future: ApiManager.getNewsSourses(),
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
                            ApiManager.getNewsSourses();
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
                            ApiManager.getNewsSourses();
                            setState(() {});
                          },
                          child: const Text("Try Again"))
                    ],
                  ));
                }
                var sources = snapshot.data?.sources ?? [];
                return SoursesTabBar(sources: sources);
                // itemBuilder: (context, i) => Text(sources?[i].name ?? ""));
              }),
        )
      ],
    );
  }
}
