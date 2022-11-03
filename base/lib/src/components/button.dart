import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../res/styles.dart';

class ButtonUp extends StatelessWidget {
  final Color? bgk, splash, shadowColor;
  final OutlinedBorder? shape;
  final Widget child;
  final Alignment alignment;
  final VoidCallback? onPressed;
  final bool disable, preferBelow;
  final String? tooltip;
  final double? elevation;
  final EdgeInsets? padding;
  const ButtonUp({Key? key,
    this.bgk, this.splash,
    this.shape, required this.child,
    this.alignment = Alignment.center,
    this.onPressed, this.disable = false,
    this.elevation, this.padding,
    this.shadowColor, this.tooltip, this.preferBelow = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgk ?? Theme.of(context).backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(shape ?? const RoundedRectangleBorder()),
          elevation: MaterialStateProperty.all<double?>(elevation),
          shadowColor: MaterialStateProperty.all<Color?>(shadowColor),
          padding: MaterialStateProperty.all<EdgeInsets>(padding ?? const EdgeInsets.only()),
        ),
        onPressed: disable ? null :onPressed,
        child: Tooltip(
          message: tooltip ?? '',
          preferBelow: preferBelow,
          child: Opacity(
              opacity: disable ? 0.4: 1,child: child),
        )
    );
  }
}


class OutlineCustomButton extends StatelessWidget {
  final Color? bgk, splash, shadowColor, textColor;
  final OutlinedBorder? shape;
  final Widget? child;
  final String? text;
  final Alignment alignment;
  final VoidCallback? onPressed;
  final bool disable, preferBelow;
  final String? tooltip;
  final double? elevation, textSize;
  final EdgeInsets? padding;
  const OutlineCustomButton({Key? key,
    this.bgk, this.splash,
    this.shape, this.child,
    this.alignment = Alignment.center,
    this.onPressed, this.disable = false,
    this.elevation, this.padding,
    this.shadowColor, this.tooltip,
    this.preferBelow = false, this.text,
    this.textSize, this.textColor}) : assert(child != null && text == null ||
      child == null && text != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bgk ?? Theme.of(context).backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(shape ?? const RoundedRectangleBorder()),
          elevation: MaterialStateProperty.all<double?>(elevation),
          shadowColor: MaterialStateProperty.all<Color?>(shadowColor),
          padding: MaterialStateProperty.all<EdgeInsets>(padding ?? const EdgeInsets.only()),
        ),
        onPressed: disable ? null :onPressed,
        child: Tooltip(
          message: tooltip ?? '',
          preferBelow: preferBelow,
          child:  Opacity(
            opacity: disable ? 0.4: 1,
            child: child ?? Text(
              text ?? '',
              style: defaultStyle(
                size: textSize ?? 6.sp,
                color: disable ? Colors.black.withOpacity(0.6) :
                textColor ?? Theme.of(context).textTheme.subtitle2?.color,
                weight: FontWeight.w800,
              ),
            ),
          ),
        )
    );
  }
}