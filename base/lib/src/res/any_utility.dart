import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import '../../utils/constants.dart';
import '../enums/enum_file.dart';
import 'colors.dart';

void showBannerBar(BuildContext context, {required String message}) {
  globalSnackBarKey.currentState?.showMaterialBanner(MaterialBanner(
    content: Text(message,
        style: TextStyle(
            color: getFontColorForBackground(Theme.of(context).backgroundColor),
            fontWeight: FontWeight.w600,
            fontSize: 12)),
    padding: const EdgeInsets.all(8),
    backgroundColor: Theme.of(context).backgroundColor,
    actions: [
      TextButton(
        onPressed: () =>
        globalSnackBarKey.currentState?..hideCurrentMaterialBanner(),
        child: Text(
          'Close',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    ],
  ));
}

void showSnackBar(BuildContext context,
    {String message = '', int? durationSec, int? durationDays,
      Widget? widget, Color? background, bool lock = false}) {
  globalSnackBarKey.currentState?.showSnackBar(SnackBar(
    content: Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background ?? Theme.of(context).bottomAppBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget ?? Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: getFontColorForBackground(
                  Theme.of(context).bottomAppBarColor),
              fontWeight: FontWeight.w500,
              fontSize: 12)),
    ),
    duration: durationDays != null ? Duration(days: durationDays)
        : Duration(seconds: durationSec ?? 2),
    padding: const EdgeInsets.all(8),
    dismissDirection: lock ? DismissDirection.none : DismissDirection.down,
    backgroundColor: background ?? Theme.of(context).backgroundColor,
  ));
}

String getDateInJiffy(
    {required DateTime date, bool? afterDate, bool? normalDate}) {
  if (afterDate == true) {
    return Jiffy("${date.year}-"
        "${date.month}"
        "-${date.day}-${date.hour}"
        "-${date.minute}-${date.second}", "yyyy-MM-dd-h-m").Hm;
  } else if (normalDate == true) {
    return Jiffy("${date.year}-"
        "${date.month}"
        "-${date.day}-${date.hour}"
        "-${date.minute}-${date.second}", "yyyy-MM-dd-h-m").yMMMd;
  } else {
    return Jiffy("${date.year}-"
        "${date.month}"
        "-${date.day}-${date.hour}"
        "-${date.minute}-${date.second}", "yyyy-MM-dd-h-m").fromNow();
  }
}

double calculatePercentageProgress(int total, int current) {
  return double.parse((current / total).toStringAsFixed(2));
}

bool checkIfDarkColor(Color background) {
  return background.computeLuminance() < 0.179;
}

Color getFontColorForBackground(Color background) {
  return (background.computeLuminance() > 0.179) ? Colors.black : Colors.white;
}

Future<Uint8List> getImageBytes(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  return response.bodyBytes; //Uint8List
}

Future readJson(String asset) async {
  final String response = await rootBundle.loadString(asset);
  final data = await json.decode(response);
  return data;
}

int randomNumberBtwRange(int max) {
  Random random = Random();
  return random.nextInt(max);
}

// bool sameUser(String? uid) {
//   return equalsIgnoreCase(uid, auth.currentUser?.uid);
// }

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

Color getOppositeBackground(BuildContext context){
  return Theme.of(context).colorScheme.inversePrimary == const ColorScheme.dark().inversePrimary ?
  lightBackground: darkBackground;
}

Color getTextLinterColor(BuildContext context){
  return Theme.of(context).colorScheme.inversePrimary == const ColorScheme.dark().inversePrimary ?
  Colors.white54: Colors.black45;
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(
      c.alpha,
      (c.red * f).round(),
      (c.green  * f).round(),
      (c.blue * f).round()
  );
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round()
  );
}

UrlType getUrlType(String url) {
  Uri uri = Uri.parse(url);
  String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();

  if (typeString == "jpg" ||typeString == "peg" || typeString == "png" || typeString == "gif") {
    return UrlType.image;
  }
  if (typeString == "mp4") {
    return UrlType.video;
  } else {
    return UrlType.unknown;
  }
}

List<String> getAlphabets(){
  List<String> alphabets=[];
  for(int i=65; i<=90; i++){
    alphabets.add(String.fromCharCode(i).toLowerCase());
  }
  return alphabets;
}

int unixTimeStampNow () => DateTime.now().millisecondsSinceEpoch~/1000;