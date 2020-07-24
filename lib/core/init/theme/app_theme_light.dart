import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _appColorScheme(),
        textTheme: _appTextTheme(),
      );

  TextTheme _appTextTheme() {
    return TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.black,
      ),
      headline2: GoogleFonts.roboto(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.black,
      ),
      headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.roboto(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.black,
      ),
      headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.black,
      ),
      subtitle1: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.black,
      ),
      subtitle2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.black,
      ),
      bodyText1: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.black,
      ),
      button: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.black,
      ),
      caption: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Colors.black,
      ),
      overline: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: Colors.black,
      ),
    );
  }

  ColorScheme _appColorScheme() => ColorScheme(
      primary: Colors.blue,
      primaryVariant: Colors.blue[900],
      secondary: Colors.lightBlue,
      secondaryVariant: Colors.lightBlue[900],
      surface: Colors.white,
      background: Colors.white,
      error: Colors.redAccent,
      onPrimary: Colors.blueAccent,
      onSecondary: Colors.lightBlueAccent,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.redAccent,
      brightness: Brightness.light);
}
