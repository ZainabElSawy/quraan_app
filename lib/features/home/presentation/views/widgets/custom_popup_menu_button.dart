import 'package:flutter/material.dart';
import 'package:quraan_app/core/constants/colors.dart';

enum MenuItem { darkMode, settings, help, aboutUs, signOut }

class CustomPopUpMenuButton extends StatelessWidget {
  // late MenuItem selectedItem;
  const CustomPopUpMenuButton({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      color: kBlackColor!.withOpacity(0.7),
      icon: const Icon(Icons.menu, color: kPrimaryColor),
      onSelected: (MenuItem item) {
        //selectedItem = item;
        if (item == MenuItem.darkMode) {
        } else if (item == MenuItem.settings) {
        } else if (item == MenuItem.help) {
        } else if (item == MenuItem.aboutUs) {
        } else if (item == MenuItem.signOut) {}
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        customPopupMenuItem(
          value: MenuItem.darkMode,
          text: 'Dark Mode',
          iconData: Icons.toggle_on,
        ),
        customPopupMenuItem(value: MenuItem.settings, text: 'Settings'),
        customPopupMenuItem(value: MenuItem.help, text: 'Help'),
        customPopupMenuItem(value: MenuItem.aboutUs, text: "About Us"),
        customPopupMenuItem(
          value: MenuItem.signOut,
          text: "Sign Out",
          color: kPrimaryColor,
        ),
      ],
    );
  }

  PopupMenuItem<MenuItem> customPopupMenuItem(
      {required MenuItem value,
      required String text,
      IconData? iconData,
      Color? color}) {
    return PopupMenuItem<MenuItem>(
      value: value,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: TextStyle(color: color ?? kSecondaryColor),
            ),
          ),
          const SizedBox(width: 7),
          Icon(
            iconData,
            color: Colors.green,
            size: 35,
          ),
        ],
      ),
    );
  }
}
