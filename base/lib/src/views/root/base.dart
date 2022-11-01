import 'package:base/src/res/colors.dart';
import 'package:base/src/views/root/components/ecosystem.dart';
import 'package:flutter/material.dart';


class ApplicationRoot extends StatefulWidget {
  final Widget child;
  const ApplicationRoot({Key? key, required this.child}) : super(key: key);

  @override
  State<ApplicationRoot> createState() => _ApplicationRootState();
}

class _ApplicationRootState extends State<ApplicationRoot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const EcosystemHandler(bukaAccent),
          Flexible(child: widget.child)
        ],
      ),
    );
  }
}
