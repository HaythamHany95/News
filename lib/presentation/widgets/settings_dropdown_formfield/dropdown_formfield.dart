import 'package:flutter/material.dart';
import 'package:news_app/utils/my_theme.dart';

class DropdownFormField extends StatelessWidget {
  final String? hintText;
  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  const DropdownFormField(
      {this.hintText,
      this.value,
      required this.items,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    // var appConfigProvider = Provider.of<AppConfiguresProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          isDense: true,
          iconEnabledColor: MyTheme.blackColor,
          borderRadius: BorderRadius.circular(20),
          // dropdownColor:

          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: MyTheme.primaryLightColor, width: 2),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: MyTheme.primaryLightColor, width: 2),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            hintText: hintText,
            // hintStyle:
            filled: true,
            // fillColor:
          ),
          items: items,
          value: value,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
