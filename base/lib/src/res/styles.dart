import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

TextStyle normalStyle = TextStyle(
  fontSize: 14.sp,
);

TextStyle titleStyle = TextStyle(
  fontSize: 35.sp,
);

TextStyle boldStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.w600,
);

TextStyle errorStyle = TextStyle(
  fontSize: 11.sp,
  color: Colors.red,
);

var smallHintStyle = TextStyle(
  fontSize: 11.sp,
  fontWeight: FontWeight.w600,
  color: Colors.grey.shade400,
);

TextStyle get bodyStyle => TextStyle(
    fontSize: 30.sp,
    wordSpacing: 3,
    height: 1.2,
    fontFamily: 'Alkalami',
    fontWeight: FontWeight.w800
);
TextStyle get subtitleStyle => TextStyle(
    fontSize: 12.sp,
    wordSpacing: 3,
    height: 1.2,
    fontFamily: 'Alkalami',
    fontWeight: FontWeight.w300
);

TextStyle defaultStyle({double? size,double? textHeight,
  Color? color, double? wordSpacing, double? letterSpacing,
  FontWeight? weight, String? family, TextDecoration?  decoration}) {
  return TextStyle(
      fontFamily: family ?? 'Poppins',
      fontSize: size ?? 14,
      fontWeight: weight,
      color: color,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: textHeight
  );
}
