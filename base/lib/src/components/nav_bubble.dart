import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../models/bar_item.dart';
import 'button.dart';

class NavBubbleHandler extends StatelessWidget {
  final VoidCallback onSelected;
  final BottomNavBarItem item;
  final bool active;
  final Color? bgk;
  final OutlinedBorder? shape;
  const NavBubbleHandler({Key? key,
    required this.onSelected,
    required this.item, required this.active, this.bgk, this.shape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1400),
      child: ButtonUp(
        elevation: 0,
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
        shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        bgk: bgk?? Colors.transparent,
        onPressed: onSelected,
        splash: item.activeColor,
        child: SizedBox(
            width: 1.8.h,
            height: 3.4.h,
            child: SvgPicture.asset(
              item.svgFile,
              color: active ? item.activeColor: item.inactiveColor,
              excludeFromSemantics: true,
            ),
          ),
      ),
    );
  }
}
