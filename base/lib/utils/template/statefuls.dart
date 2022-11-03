import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../src/res/any_utility.dart';
import '../natives/offline_builder.dart';

abstract class BaseStatefulTemplate extends ConsumerStatefulWidget {
  const BaseStatefulTemplate({Key? key}) : super(key: key);
}

abstract class BaseScreenTemplateState<T extends BaseStatefulTemplate> extends ConsumerState<T> {
  PreferredSizeWidget? appBar();

  bool _isHome = false, _stretch = false, _zoom = false;
  Color? _bck;

  Widget? floatingActionButton();


  Widget? bottomBar();


  void toggleBckColor(Color value){
    _bck = value;
  }

  void isHomeScreen(bool isHome) {
    _isHome = isHome;
  }

  void stretchBody(bool value) {
    _stretch = value;
  }

  void toggleZoom(bool value) {
    setState(() {
      _zoom = value;
    });
  }
}
mixin BaseScreen<T extends BaseStatefulTemplate> on BaseScreenTemplateState<T> {
  Widget body(bool internetAvailable);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: _stretch,
      body: OfflineBuilderLayout(
        builder: (context, connected, child){
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: EdgeInsets.all(_zoom  ? 8.0 : 0.0),
            child: body(connected),
          );
        },
      ),
      backgroundColor: _bck ?? (_isHome?
      darken(Theme.of(context).backgroundColor, 80):
      Theme.of(context).scaffoldBackgroundColor),
      appBar: appBar(),
      floatingActionButton: floatingActionButton(),
      bottomNavigationBar: bottomBar(),
    );
  }
}