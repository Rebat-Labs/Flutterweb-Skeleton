import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(
              "settings",
            params: {"name": "Buka Direct"},
            queryParams: {
              "email": "buka@rebat.org",
              "founded": "2022",
              "place": "Sweden"
            }
          ),
          child: const Text("Go to Settings page"),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final String name;
  const SettingsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
