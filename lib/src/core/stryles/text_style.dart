import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTextStyle {
  static TextStyle textStyle_12() {
    return TextStyle(
        fontSize: 12,
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontWeight: FontWeight.w900);
  }

  static TextStyle textStyle_14() {
    return TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 14,
        fontFamily: GoogleFonts.cairo().fontFamily);
  }

  static TextStyle textStyle_16() {
    return TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.cabin().fontFamily,
        fontWeight: FontWeight.w800);
  }

  static TextStyle textStyle_18() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      fontFamily: GoogleFonts.cabin().fontFamily,
    );
  }

  static TextStyle textStyle_20() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      fontFamily: GoogleFonts.cabin(fontWeight: FontWeight.w500).fontFamily,
    );
  }

  static TextStyle textStyle_22() {
    return TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.cabin().fontFamily);
  }

  static TextStyle textStyle_24() {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.cabin().fontFamily);
  }

  static TextStyle textStyle_26() {
    return TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.cabin(fontWeight: FontWeight.w500).fontFamily);
  }

  static TextStyle textStyle_36() {
    return TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        fontFamily:
            GoogleFonts.aBeeZee(fontWeight: FontWeight.w500).fontFamily);
  }
}
