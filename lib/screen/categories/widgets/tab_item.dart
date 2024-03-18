import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/utils/my_theme.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final Source sourse;

  const TabItem({required this.sourse, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.primaryLightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: MyTheme.primaryLightColor,
            width: 2,
          )),
      child: Text(
        sourse.name ?? "",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor),
      ),
    );
  }
}
