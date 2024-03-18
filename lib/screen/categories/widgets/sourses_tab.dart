import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/screen/categories/widgets/tab_item.dart';

class SoursesTab extends StatefulWidget {
  final List<Source> sources;

  const SoursesTab({required this.sources, super.key});

  @override
  State<SoursesTab> createState() => _SoursesTabState();
}

class _SoursesTabState extends State<SoursesTab> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: TabBar(
        onTap: (newIndex) {
          selectedIndex = newIndex;
          setState(() {});
        },
        isScrollable: true,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        tabs: widget.sources
            .map(
              (sourseItem) => TabItem(
                sourse: sourseItem,
                isSelected:
                    (selectedIndex == widget.sources.indexOf(sourseItem)),
              ),
            )
            .toList(),
      ),
    );
  }
}
