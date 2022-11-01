import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  final String label;
  final String detailsPath;
  const RootScreen({Key? key, required this.label, required this.detailsPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Screen $label"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Just screen - $label"),
            const Gap(18),

            TextButton(
              onPressed: () => context.go(detailsPath),
              child: const Text(
                'View details'
              )
            )
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String label;
  const DetailsScreen({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail screen $label"),
      ),
      body: const Center(
        child: Text("Just a detail screen"),
      ),
    );
  }
}
