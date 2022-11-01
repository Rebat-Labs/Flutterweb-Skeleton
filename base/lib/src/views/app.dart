import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import '../blocs/routing/mechanism.dart';
import '../blocs/settings.dart';

class Application extends ConsumerStatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application>  with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    ref.read(settingsProvider.notifier).loadSettings();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var settings = ref.watch(settingsProvider);

    return AnimatedBuilder(
      animation: settings,
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              routerConfig: router,
              scaffoldMessengerKey: globalSnackBarKey,
              //debugShowCheckedModeBanner: kDebugMode,
              debugShowCheckedModeBanner: false,
              title: "Base Platform Codebase",
              themeMode: settings.themeMode,
              theme:  settings.service.lightMode(),
              darkTheme: settings.service.darkMode(),
            );
          }
        );
      }
    );
  }
}
