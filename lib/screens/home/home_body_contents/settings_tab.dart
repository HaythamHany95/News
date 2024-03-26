import 'package:flutter/material.dart';

///localization_import
import 'package:news_app/screens/home/widgets/settings_dropdown_formfield/dropdown_formfield.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // var appConfigProvider = Provider.of<AppConfiguresProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language"),
          DropdownFormField(
              hintText: "English",
              items: [
                DropdownMenuItem(value: "English", child: Text("English")),
                DropdownMenuItem(value: "Arabic", child: Text("Arabic"))
              ],
              onChanged: (newValue) {}),
        ],
      ),
    );
  }
}
