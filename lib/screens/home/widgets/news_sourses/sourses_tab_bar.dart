import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/screens/home/widgets/news_articles/article_item.dart';
import 'package:news_app/screens/home/widgets/news_sourses/sourse_tab_item.dart';

class SoursesTabBar extends StatefulWidget {
  final List<Source> sources;

  const SoursesTabBar({required this.sources, super.key});

  @override
  State<SoursesTabBar> createState() => _SoursesTabBarState();
}

class _SoursesTabBarState extends State<SoursesTabBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (newIndex) {
              selectedIndex = newIndex;
              setState(() {});
            },
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            tabs: widget.sources
                .map(
                  (sourse) => SourseTabItem(
                    sourse: sourse,
                    isSelected:
                        (selectedIndex == widget.sources.indexOf(sourse)),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(child: ArticleItem(sourse: widget.sources[selectedIndex]))
      ],
    );
  }
}
