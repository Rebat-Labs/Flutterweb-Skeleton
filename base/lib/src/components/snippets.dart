import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SvgContainer extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? height, width;
  const SvgContainer({Key? key, required this.asset,
    this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? height ?? 20.h,
      height: height ?? 20.h,
      child: SvgPicture.asset(
        asset,
        color: color,
      ),
    );
  }
}
class AssetContainer extends StatelessWidget {
  final String asset;
  final Color? color, boxColor;
  final double? height, width, radius;
  final EdgeInsetsGeometry? padding, margin;
  const AssetContainer({Key? key, required this.asset,
    this.height, this.width, this.color,
    this.boxColor, this.radius, this.padding, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? height ?? 20.h,
      height: height ?? 20.h,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(radius?? 6)
      ),
      child: Image.asset(
        asset,
        color: color,
      ),
    );
  }
}
