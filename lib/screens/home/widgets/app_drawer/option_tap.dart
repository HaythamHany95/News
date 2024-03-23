import 'package:flutter/material.dart';

class DrawerOptionTap extends StatelessWidget {
  final Icon icon;
  final Text text;
  final Function()? onTap;
  const DrawerOptionTap({
    required this.icon,
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: InkWell(
        onTap: onTap,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              width: 12,
            ),
            text
          ],
        ),
      ),
    );
  }
}
