import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sizer/sizer.dart';

import '../../src/res/any_utility.dart';

typedef ValueWidgetBuilder<T> = Widget Function(BuildContext context, T value, Widget child);

class OfflineBuilderLayout extends StatelessWidget {
  final Widget? child;
  final ValueWidgetBuilder<bool> builder;
  const OfflineBuilderLayout({Key? key,
    this.child, required this.builder,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ){
        final bool connected = connectivity != ConnectivityResult.none;

        return Stack(
          fit: StackFit.expand,
          children: [
            builder(context, connected, child),
            Positioned(
              height: connected ? 0.0 :26.0,
              left: 0.0,
              right: 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: connected ? null : darken(Theme.of(context).backgroundColor, 20),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: !connected ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Internet connection available",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 9.2.sp,
                      ),
                    ),
                  ],
                ) : const SizedBox.shrink(),
              ),
            ),
          ],
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
