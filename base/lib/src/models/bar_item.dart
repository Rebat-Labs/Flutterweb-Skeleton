import 'package:flutter/cupertino.dart';

class BottomNavBarItem {
  final String svgFile;
  final Color activeColor, inactiveColor;
  final String title;
  final String initialLocation;
  final int badgeCount, index;
  final VoidCallback? onPressed;

  // to add more functionality to this model as we develop

  BottomNavBarItem(this.index, {required this.initialLocation,
    required this.svgFile, required this.activeColor,
    this.inactiveColor = CupertinoColors.systemGrey, required this.title,
    this.onPressed, this.badgeCount = 0});
}