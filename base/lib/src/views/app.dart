import 'package:flutter/material.dart';

import '../blocs/routing/mechanism.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Base Platform Codebase",
    );
  }
}
