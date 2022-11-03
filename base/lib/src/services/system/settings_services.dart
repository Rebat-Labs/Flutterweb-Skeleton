import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../res/any_utility.dart';
import '../../res/colors.dart';
import '../storage/prefs.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> theme() async {
    String? theme = Prefs.getString('theme');

    if(theme == null) return ThemeMode.light;

    if(theme == 'system'){
      return ThemeMode.system;
    }else if(theme == 'dark'){
      return ThemeMode.dark;
    }else{
      return ThemeMode.light;
    }
  }
  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    await Prefs.saveString('theme', theme.name);
  }

  /// Loads the Native preferred DarkMode settings.
  ThemeData darkMode () {
    return ThemeData(
      primaryIconTheme: ThemeData.dark().primaryIconTheme.copyWith(
          color: Colors.white
      ),
      scaffoldBackgroundColor: darkBackground,
      backgroundColor: darkBackground,
      canvasColor: lighten(darkBackground, 10),
      bottomAppBarColor: darkCompliment,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: brightLogo
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkCompliment,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'Poppins',
            fontSize: SizerUtil.deviceType ==  DeviceType.mobile ? 13.sp : 6.4.sp
        ),
      ),
      cardColor: lighten(darkBackground, 10),
      primaryColor: Colors.white,
      focusColor: magicColor,
      indicatorColor: Colors.white,
      colorScheme: const ColorScheme.dark().copyWith(
          secondary: lighten(darkBackground, 4)
      ),
    );
  }

  ThemeData lightMode () {
    return ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: lightCompliment,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Poppins',
            fontSize: SizerUtil.deviceType ==  DeviceType.mobile ? 13.sp : 6.4.sp,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
      ),
      primaryColor: Colors.black,
      indicatorColor: Colors.black,
      bottomAppBarColor: lightCompliment,
      focusColor: brightLogo,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light().copyWith(
          secondary: lighten(darkBackground, 4),
          primary: brightLogo
      ),
      backgroundColor: lightBackground,
    );
  }
}
