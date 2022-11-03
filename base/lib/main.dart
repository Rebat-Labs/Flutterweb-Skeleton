import 'package:base/src/services/storage/prefs.dart';
import 'package:base/src/views/app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{
  setPathUrlStrategy();
  await Prefs.init();
  runApp(const ProviderScope(child: Application()));
}