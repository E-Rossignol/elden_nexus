import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff303224),
      surfaceTint: Color(0xff5f5f4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff535444),
      onPrimaryContainer: Color(0xfff6f5e0),
      secondary: Color(0xff5f5f57),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe9e7dd),
      onSecondaryContainer: Color(0xff4b4b43),
      tertiary: Color(0xff29332c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4b554d),
      onTertiaryContainer: Color(0xffecf7ed),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffdf9f6),
      onBackground: Color(0xff1c1b1a),
      surface: Color(0xfffdf9f6),
      onSurface: Color(0xff1c1b1a),
      surfaceVariant: Color(0xffe5e3d8),
      onSurfaceVariant: Color(0xff47473f),
      outline: Color(0xff78776e),
      outlineVariant: Color(0xffc9c7bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inverseOnSurface: Color(0xfff4f0ed),
      inversePrimary: Color(0xffc8c8b4),
      primaryFixed: Color(0xffe4e4cf),
      onPrimaryFixed: Color(0xff1b1c10),
      primaryFixedDim: Color(0xffc8c8b4),
      onPrimaryFixedVariant: Color(0xff474839),
      secondaryFixed: Color(0xffe5e3d8),
      onSecondaryFixed: Color(0xff1c1c16),
      secondaryFixedDim: Color(0xffc9c7bd),
      onSecondaryFixedVariant: Color(0xff474740),
      tertiaryFixed: Color(0xffdae5db),
      onTertiaryFixed: Color(0xff141e18),
      tertiaryFixedDim: Color(0xffbec9c0),
      onTertiaryFixedVariant: Color(0xff3f4942),
      surfaceDim: Color(0xffddd9d7),
      surfaceBright: Color(0xfffdf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f0),
      surfaceContainer: Color(0xfff1edea),
      surfaceContainerHigh: Color(0xffebe7e5),
      surfaceContainerHighest: Color(0xffe5e2df),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff303224),
      surfaceTint: Color(0xff5f5f4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff535444),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff43433c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff76756d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff29332c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4b554d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffdf9f6),
      onBackground: Color(0xff1c1b1a),
      surface: Color(0xfffdf9f6),
      onSurface: Color(0xff1c1b1a),
      surfaceVariant: Color(0xffe5e3d8),
      onSurfaceVariant: Color(0xff43433b),
      outline: Color(0xff605f57),
      outlineVariant: Color(0xff7c7b72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inverseOnSurface: Color(0xfff4f0ed),
      inversePrimary: Color(0xffc8c8b4),
      primaryFixed: Color(0xff757664),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c5d4d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff76756d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5d5c54),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6d776f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff545e57),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d7),
      surfaceBright: Color(0xfffdf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f0),
      surfaceContainer: Color(0xfff1edea),
      surfaceContainerHigh: Color(0xffebe7e5),
      surfaceContainerHighest: Color(0xffe5e2df),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff222316),
      surfaceTint: Color(0xff5f5f4f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff434435),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff22231c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff43433c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1b241e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3b453e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffdf9f6),
      onBackground: Color(0xff1c1b1a),
      surface: Color(0xfffdf9f6),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe5e3d8),
      onSurfaceVariant: Color(0xff24241d),
      outline: Color(0xff43433b),
      outlineVariant: Color(0xff43433b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffeeedd8),
      primaryFixed: Color(0xff434435),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2d2e20),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff43433c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2d2d26),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3b453e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff252f29),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d7),
      surfaceBright: Color(0xfffdf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f0),
      surfaceContainer: Color(0xfff1edea),
      surfaceContainerHigh: Color(0xffebe7e5),
      surfaceContainerHighest: Color(0xffe5e2df),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc8c8b4),
      surfaceTint: Color(0xffc8c8b4),
      onPrimary: Color(0xff303123),
      primaryContainer: Color(0xff393a2c),
      onPrimaryContainer: Color(0xffccccb8),
      secondary: Color(0xffc9c7bd),
      onSecondary: Color(0xff31312a),
      secondaryContainer: Color(0xff3f3f38),
      onSecondaryContainer: Color(0xffd6d4ca),
      tertiary: Color(0xffbec9c0),
      onTertiary: Color(0xff29332c),
      tertiaryContainer: Color(0xff313b34),
      onTertiaryContainer: Color(0xffc2cdc4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff141312),
      onBackground: Color(0xffe5e2df),
      surface: Color(0xff141312),
      onSurface: Color(0xffe5e2df),
      surfaceVariant: Color(0xff47473f),
      onSurfaceVariant: Color(0xffc9c7bc),
      outline: Color(0xff929187),
      outlineVariant: Color(0xff47473f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2df),
      inverseOnSurface: Color(0xff31302f),
      inversePrimary: Color(0xff5f5f4f),
      primaryFixed: Color(0xffe4e4cf),
      onPrimaryFixed: Color(0xff1b1c10),
      primaryFixedDim: Color(0xffc8c8b4),
      onPrimaryFixedVariant: Color(0xff474839),
      secondaryFixed: Color(0xffe5e3d8),
      onSecondaryFixed: Color(0xff1c1c16),
      secondaryFixedDim: Color(0xffc9c7bd),
      onSecondaryFixedVariant: Color(0xff474740),
      tertiaryFixed: Color(0xffdae5db),
      onTertiaryFixed: Color(0xff141e18),
      tertiaryFixedDim: Color(0xffbec9c0),
      onTertiaryFixedVariant: Color(0xff3f4942),
      surfaceDim: Color(0xff141312),
      surfaceBright: Color(0xff3a3937),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1b1a),
      surfaceContainer: Color(0xff20201e),
      surfaceContainerHigh: Color(0xff2b2a28),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffccccb8),
      surfaceTint: Color(0xffc8c8b4),
      onPrimary: Color(0xff16170b),
      primaryContainer: Color(0xff929280),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcdcbc1),
      onSecondary: Color(0xff161711),
      secondaryContainer: Color(0xff929188),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc3cdc4),
      onTertiary: Color(0xff0f1813),
      tertiaryContainer: Color(0xff89938b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff141312),
      onBackground: Color(0xffe5e2df),
      surface: Color(0xff141312),
      onSurface: Color(0xfffefaf7),
      surfaceVariant: Color(0xff47473f),
      onSurfaceVariant: Color(0xffcdcbc0),
      outline: Color(0xffa4a399),
      outlineVariant: Color(0xff84837a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2df),
      inverseOnSurface: Color(0xff2b2a28),
      inversePrimary: Color(0xff48493a),
      primaryFixed: Color(0xffe4e4cf),
      onPrimaryFixed: Color(0xff111207),
      primaryFixedDim: Color(0xffc8c8b4),
      onPrimaryFixedVariant: Color(0xff363729),
      secondaryFixed: Color(0xffe5e3d8),
      onSecondaryFixed: Color(0xff11120c),
      secondaryFixedDim: Color(0xffc9c7bd),
      onSecondaryFixedVariant: Color(0xff373730),
      tertiaryFixed: Color(0xffdae5db),
      onTertiaryFixed: Color(0xff0a130e),
      tertiaryFixedDim: Color(0xffbec9c0),
      onTertiaryFixedVariant: Color(0xff2f3832),
      surfaceDim: Color(0xff141312),
      surfaceBright: Color(0xff3a3937),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1b1a),
      surfaceContainer: Color(0xff20201e),
      surfaceContainerHigh: Color(0xff2b2a28),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdfce6),
      surfaceTint: Color(0xffc8c8b4),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffccccb8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdfbf0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcdcbc1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3fef3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc3cdc4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff141312),
      onBackground: Color(0xffe5e2df),
      surface: Color(0xff141312),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff47473f),
      onSurfaceVariant: Color(0xfffdfbef),
      outline: Color(0xffcdcbc0),
      outlineVariant: Color(0xffcdcbc0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2df),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff2a2b1d),
      primaryFixed: Color(0xffe9e8d3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffccccb8),
      onPrimaryFixedVariant: Color(0xff16170b),
      secondaryFixed: Color(0xffe9e7dd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcdcbc1),
      onSecondaryFixedVariant: Color(0xff161711),
      tertiaryFixed: Color(0xffdfeae0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc3cdc4),
      onTertiaryFixedVariant: Color(0xff0f1813),
      surfaceDim: Color(0xff141312),
      surfaceBright: Color(0xff3a3937),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1b1a),
      surfaceContainer: Color(0xff20201e),
      surfaceContainerHigh: Color(0xff2b2a28),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          fontFamily: 'GeoSansLight',
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
