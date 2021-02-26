import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData dark() {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark(),
      textTheme: _materialTypeScaledTextTheme,
    );
  }

  static ThemeData light() {
    return ThemeData.from(
      colorScheme: const ColorScheme.light(),
      textTheme: _materialTypeScaledTextTheme,
    );
  }

  static final TextTheme _materialTypeScaledTextTheme = TextTheme(
    headline1: GoogleFonts.inconsolata(
      fontSize: 112,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.inconsolata(
      fontSize: 70,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: GoogleFonts.inconsolata(
      fontSize: 56,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.inconsolata(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.inconsolata(
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    headline6: GoogleFonts.inconsolata(
      fontSize: 23,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.inconsolata(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.inconsolata(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.workSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.workSans(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.workSans(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.workSans(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.workSans(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
