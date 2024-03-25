import 'package:flutter/material.dart';
import 'package:news_app/utils/my_theme.dart';

class AppBarSearchField extends StatefulWidget {
  final TextEditingController? controller;

  const AppBarSearchField({this.controller, super.key});

  @override
  State<AppBarSearchField> createState() => _AppBarSearchFieldState();
}

class _AppBarSearchFieldState extends State<AppBarSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
      autofocus: true,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          filled: true,
          fillColor: MyTheme.whiteColor,
          hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 14, color: MyTheme.primaryLightColor.withOpacity(0.5)),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: ImageIcon(
              color: MyTheme.primaryLightColor,
              const AssetImage('assets/images/search_icon.png'),
            ),
          ),
          prefixIcon: (widget.controller?.text == "")
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: MyTheme.primaryLightColor,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    widget.controller?.text = "";
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.clear,
                    color: MyTheme.primaryLightColor,
                  ),
                ),
          hintText: "Search Article",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          )),
    );
  }
}
