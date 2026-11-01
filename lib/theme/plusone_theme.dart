import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plusone/theme/plusone_colors.dart';

abstract final class PlusoneTheme {
  static const double radiusControl = 999;
  static const double radiusCard = 20;
  static const double radiusPanel = 28;
  static const double controlHeightDesktop = 50;
  static const double controlHeightCompact = 40;
  static const double desktopBreakpoint = 900;

  static String get _interFamily => GoogleFonts.inter().fontFamily!;

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _interFamily,
      scaffoldBackgroundColor: PlusoneColors.cloud,
      colorScheme: const ColorScheme.light(
        primary: PlusoneColors.clubBlue,
        secondary: PlusoneColors.acidLime,
        onPrimary: PlusoneColors.white,
        onSecondary: PlusoneColors.ink,
        surface: PlusoneColors.white,
        onSurface: PlusoneColors.ink,
        outline: PlusoneColors.line,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: _interFamily,
        bodyColor: PlusoneColors.ink,
        displayColor: PlusoneColors.ink,
      ),
      primaryTextTheme: base.primaryTextTheme.apply(
        fontFamily: _interFamily,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: PlusoneColors.clubBlue,
        foregroundColor: PlusoneColors.white,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: PlusoneColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: TextStyle(
          fontFamily: _interFamily,
          color: PlusoneColors.slate,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          fontFamily: _interFamily,
          color: PlusoneColors.slate,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusControl),
          borderSide: const BorderSide(color: PlusoneColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusControl),
          borderSide: const BorderSide(color: PlusoneColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusControl),
          borderSide: const BorderSide(color: PlusoneColors.clubBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusControl),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;

  static double controlHeight(BuildContext context) =>
      isDesktop(context) ? controlHeightDesktop : controlHeightCompact;
}
