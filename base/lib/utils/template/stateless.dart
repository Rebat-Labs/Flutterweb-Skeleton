import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../src/res/any_utility.dart';
import '../natives/offline_builder.dart';

abstract class BaseStatelessTemplate extends ConsumerWidget {
  const BaseStatelessTemplate({Key? key}) : super(key: key);


  Widget body(BuildContext context, WidgetRef ref, bool internetAvailable);
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref);
  Widget? bottomBar(BuildContext context ,WidgetRef ref);

  bool isHomeScreen();

  Color? background(BuildContext context, WidgetRef ref){
    return Theme.of(context).backgroundColor;
  }

  @override
  Widget build(BuildContext context, ref) {
    return StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            body: OfflineBuilderLayout(
              builder: (context, connected, child){
                return body(context, ref, connected);
              },
            ),
            backgroundColor: isHomeScreen()?
            darken(Theme.of(context).backgroundColor, 100):
            background(context, ref),
            appBar: appBar(context, ref),
            bottomNavigationBar: bottomBar(context, ref),
          );
        }
    );
  }
}

