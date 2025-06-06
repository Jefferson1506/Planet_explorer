import 'package:flutter/material.dart';

class ColorTheme {
  ThemeData get lightTheme => ThemeData.from(
    colorScheme: lightHighContrastScheme(),
    useMaterial3: true,
  );
  ThemeData get darkTheme =>
      ThemeData.from(colorScheme: darkHighContrastScheme(), useMaterial3: true);

  ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7e64ff),
      surfaceTint: Color(0xffbbaaff),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffddd2ff),
      onPrimaryContainer: Color.fromARGB(255, 38, 23, 70),
      secondary: Color(0xff675d7d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe8e0ff),
      onSecondaryContainer: Color(0xff201933),
      tertiary: Color(0xff9a647d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8e8),
      onTertiaryContainer: Color(0xff32101d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xffffffff),
      onSurface: Color(0xff1c1b1f),
      onSurfaceVariant: Color(0xff49454f),
      outline: Color(0xff79747e),
      outlineVariant: Color(0xffcac4d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffcdbdff),
      primaryFixed: Color(0xffddd2ff),
      onPrimaryFixed: Color(0xff1c1133),
      primaryFixedDim: Color(0xffbbaaff),
      onPrimaryFixedVariant: Color(0xff1c1133),
      secondaryFixed: Color(0xffe8e0ff),
      onSecondaryFixed: Color(0xff201933),
      secondaryFixedDim: Color(0xffccc2e0),
      onSecondaryFixedVariant: Color(0xff201933),
      tertiaryFixed: Color(0xffffd8e8),
      onTertiaryFixed: Color(0xff32101d),
      tertiaryFixedDim: Color(0xffecb9cd),
      onTertiaryFixedVariant: Color(0xff32101d),
      surfaceDim: Color(0xfff4eff4),
      surfaceBright: Color(0xffffffff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f9),
      surfaceContainer: Color(0xfff0ebf3),
      surfaceContainerHigh: Color(0xffe8e3ec),
      surfaceContainerHighest: Color(0xffdfdae4),
    );
  }

  ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff302259),
      surfaceTint: Color(0xff63568f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc9b9fa),
      onPrimaryContainer: Color(0xff1d102b),
      secondary: Color(0xff4c465b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe0d8ef),
      onSecondaryContainer: Color(0xff1f1a2c),
      tertiary: Color(0xff7c4a60),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdbe6),
      onTertiaryContainer: Color(0xff2e0f1c),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffdf7ff),
      onSurface: Color(0xff1c1b1f),
      onSurfaceVariant: Color(0xff49454f),
      outline: Color(0xff79747e),
      outlineVariant: Color(0xffc4c3c9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffcdbdff),
      primaryFixed: Color(0xffe8ddff),
      onPrimaryFixed: Color(0xff1d102b),
      primaryFixedDim: Color(0xffcdbdff),
      onPrimaryFixedVariant: Color(0xff1d102b),
      secondaryFixed: Color(0xffe7def8),
      onSecondaryFixed: Color(0xff1f1a2c),
      secondaryFixedDim: Color(0xffcbc3dc),
      onSecondaryFixedVariant: Color(0xff1f1a2c),
      tertiaryFixed: Color(0xffffd9e4),
      onTertiaryFixed: Color(0xff2e0f1c),
      tertiaryFixedDim: Color(0xffeeb8c9),
      onTertiaryFixedVariant: Color(0xff2e0f1c),
      surfaceDim: Color(0xffe8e0f0),
      surfaceBright: Color(0xffffffff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2fa),
      surfaceContainer: Color(0xfff0eaf4),
      surfaceContainerHigh: Color(0xffe8e0f0),
      surfaceContainerHighest: Color(0xffded8e4),
    );
  }
}
