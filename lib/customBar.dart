// custom_navigation_bar.dart
import 'package:flutter/material.dart';

import 'customColour.dart';
import 'customtext.dart';


class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: CustomColor.cardBackground,
      selectedItemColor: CustomColor.primary,
      unselectedItemColor: CustomColor.textSecondary,
      selectedLabelStyle: CustomText.bodyBold,
      unselectedLabelStyle: CustomText.body,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
