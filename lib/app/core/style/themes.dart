// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import das telas
import 'package:pokedex/app/core/style/app_colors.dart';

class Themes {
  Themes._();

  // light colors
  static const Color _backgroundColorLight = AppColors.white;
  static const Color _primaryColorLight = AppColors.whiteSmoke;
  static const Color _secondaryColorLight = AppColors.crimson;
  static const Color _textPrimaryLight = AppColors.nero;
  static const Color _textSecondaryLight = AppColors.dimGray;

  // .****************
  // Theme - Light
  // .****************
  static const TextStyle _headlineLargeTextLight = TextStyle(
    color: _backgroundColorLight,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontSize: 24,
  );

  static const TextStyle _displayMediumTextLight = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontSize: 17,
  );

  static const TextStyle _displaySmallTextLight = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontSize: 12,
  );

  static const TextStyle _defaultTextLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: _textPrimaryLight,
    fontFamily: "Poppins",
    fontSize: 16,
  );

  static const TextStyle _bodySmallTextLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: _textSecondaryLight,
    fontFamily: "Poppins",
    fontSize: 14,
  );

  static const TextTheme _textThemeLight = TextTheme(
    headlineLarge: _headlineLargeTextLight,
    displayMedium: _displayMediumTextLight,
    displaySmall: _displaySmallTextLight,
    bodyMedium: _defaultTextLight,
    bodySmall: _bodySmallTextLight,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: _secondaryColorLight,
      titleTextStyle: TextStyle(
        color: _backgroundColorLight,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: _secondaryColorLight,
      ),
      iconTheme: IconThemeData(
        color: _backgroundColorLight,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _primaryColorLight,
      surfaceTintColor: _secondaryColorLight,
    ),
    textTheme: _textThemeLight,
    colorScheme: const ColorScheme.light(
      background: _backgroundColorLight,
      primary: _primaryColorLight,
      secondary: _secondaryColorLight,
      tertiary: _textPrimaryLight,
      onTertiary: _textSecondaryLight,
    ),
    cardTheme: CardTheme(
      color: _backgroundColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 8 ),
      ),
      elevation: 5,
    ),
    iconTheme: const IconThemeData(
      color: _textPrimaryLight,
      size: 18,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      labelStyle: _defaultTextLight,
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: _secondaryColorLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _secondaryColorLight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _backgroundColorLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 30 ),
      ),
    ),
  );
}