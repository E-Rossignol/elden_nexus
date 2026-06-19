import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00040a),
      surfaceTint: Color(0xff52606f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1b2936),
      onPrimaryContainer: Color(0xffa7b5c6),
      secondary: Color(0xff5a5f65),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe3e7ef),
      onSecondaryContainer: Color(0xff464b51),
      tertiary: Color(0xff050009),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff302233),
      onTertiaryContainer: Color(0xffc1acc2),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffbf9fa),
      onBackground: Color(0xff1b1c1d),
      surface: Color(0xfffbf9fa),
      onSurface: Color(0xff1b1c1d),
      surfaceVariant: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xff44474c),
      outline: Color(0xff74777c),
      outlineVariant: Color(0xffc4c6cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inverseOnSurface: Color(0xfff2f0f1),
      inversePrimary: Color(0xffbac8da),
      primaryFixed: Color(0xffd6e4f6),
      onPrimaryFixed: Color(0xff0f1d2a),
      primaryFixedDim: Color(0xffbac8da),
      onPrimaryFixedVariant: Color(0xff3b4857),
      secondaryFixed: Color(0xffdee3eb),
      onSecondaryFixed: Color(0xff171c22),
      secondaryFixedDim: Color(0xffc2c7ce),
      onSecondaryFixedVariant: Color(0xff42474e),
      tertiaryFixed: Color(0xfff2dcf3),
      onTertiaryFixed: Color(0xff241727),
      tertiaryFixedDim: Color(0xffd5c0d6),
      onTertiaryFixedVariant: Color(0xff514254),
      surfaceDim: Color(0xffdbd9da),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f4),
      surfaceContainer: Color(0xfff0edee),
      surfaceContainerHigh: Color(0xffeae7e9),
      surfaceContainerHighest: Color(0xffe4e2e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00040a),
      surfaceTint: Color(0xff52606f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1b2936),
      onPrimaryContainer: Color(0xffd2e1f3),
      secondary: Color(0xff3e434a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff70757c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff050009),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff302233),
      onTertiaryContainer: Color(0xffeed7ee),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffbf9fa),
      onBackground: Color(0xff1b1c1d),
      surface: Color(0xfffbf9fa),
      onSurface: Color(0xff1b1c1d),
      surfaceVariant: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xff404348),
      outline: Color(0xff5c5f64),
      outlineVariant: Color(0xff787b80),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inverseOnSurface: Color(0xfff2f0f1),
      inversePrimary: Color(0xffbac8da),
      primaryFixed: Color(0xff687686),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff505d6d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff70757c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff575c63),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff816f83),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff675669),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9da),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f4),
      surfaceContainer: Color(0xfff0edee),
      surfaceContainerHigh: Color(0xffeae7e9),
      surfaceContainerHighest: Color(0xffe4e2e3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00040a),
      surfaceTint: Color(0xff52606f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1b2936),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1e2328),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3e434a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff050009),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff302233),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffbf9fa),
      onBackground: Color(0xff1b1c1d),
      surface: Color(0xfffbf9fa),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xff212428),
      outline: Color(0xff404348),
      outlineVariant: Color(0xff404348),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe0edff),
      primaryFixed: Color(0xff374453),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff202e3c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3e434a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff282d33),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4d3e50),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff362839),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9da),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f4),
      surfaceContainer: Color(0xfff0edee),
      surfaceContainerHigh: Color(0xffeae7e9),
      surfaceContainerHighest: Color(0xffe4e2e3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac8da),
      surfaceTint: Color(0xffbac8da),
      onPrimary: Color(0xff24323f),
      primaryContainer: Color(0xff071522),
      onPrimaryContainer: Color(0xff94a2b3),
      secondary: Color(0xffc2c7ce),
      onSecondary: Color(0xff2c3137),
      secondaryContainer: Color(0xff383d43),
      onSecondaryContainer: Color(0xffccd0d8),
      tertiary: Color(0xffd5c0d6),
      onTertiary: Color(0xff3a2b3d),
      tertiaryContainer: Color(0xff1b0f1f),
      onTertiaryContainer: Color(0xffae9aaf),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff131314),
      onBackground: Color(0xffe4e2e3),
      surface: Color(0xff131314),
      onSurface: Color(0xffe4e2e3),
      surfaceVariant: Color(0xff44474c),
      onSurfaceVariant: Color(0xffc4c6cc),
      outline: Color(0xff8e9196),
      outlineVariant: Color(0xff44474c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e3),
      inverseOnSurface: Color(0xff303031),
      inversePrimary: Color(0xff52606f),
      primaryFixed: Color(0xffd6e4f6),
      onPrimaryFixed: Color(0xff0f1d2a),
      primaryFixedDim: Color(0xffbac8da),
      onPrimaryFixedVariant: Color(0xff3b4857),
      secondaryFixed: Color(0xffdee3eb),
      onSecondaryFixed: Color(0xff171c22),
      secondaryFixedDim: Color(0xffc2c7ce),
      onSecondaryFixedVariant: Color(0xff42474e),
      tertiaryFixed: Color(0xfff2dcf3),
      onTertiaryFixed: Color(0xff241727),
      tertiaryFixedDim: Color(0xffd5c0d6),
      onTertiaryFixedVariant: Color(0xff514254),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff39393a),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1b1c1d),
      surfaceContainer: Color(0xff1f2021),
      surfaceContainerHigh: Color(0xff2a2a2b),
      surfaceContainerHighest: Color(0xff343536),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbeccde),
      surfaceTint: Color(0xffbac8da),
      onPrimary: Color(0xff091724),
      primaryContainer: Color(0xff8492a3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc7cbd3),
      onSecondary: Color(0xff12171c),
      secondaryContainer: Color(0xff8c9198),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdac4da),
      onTertiary: Color(0xff1e1221),
      tertiaryContainer: Color(0xff9e8b9f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131314),
      onBackground: Color(0xffe4e2e3),
      surface: Color(0xff131314),
      onSurface: Color(0xfffdfafb),
      surfaceVariant: Color(0xff44474c),
      onSurfaceVariant: Color(0xffc8cbd0),
      outline: Color(0xffa0a3a8),
      outlineVariant: Color(0xff808388),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e3),
      inverseOnSurface: Color(0xff2a2a2b),
      inversePrimary: Color(0xff3c4958),
      primaryFixed: Color(0xffd6e4f6),
      onPrimaryFixed: Color(0xff04121f),
      primaryFixedDim: Color(0xffbac8da),
      onPrimaryFixedVariant: Color(0xff2a3745),
      secondaryFixed: Color(0xffdee3eb),
      onSecondaryFixed: Color(0xff0d1217),
      secondaryFixedDim: Color(0xffc2c7ce),
      onSecondaryFixedVariant: Color(0xff32373d),
      tertiaryFixed: Color(0xfff2dcf3),
      onTertiaryFixed: Color(0xff190c1c),
      tertiaryFixedDim: Color(0xffd5c0d6),
      onTertiaryFixedVariant: Color(0xff403143),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff39393a),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1b1c1d),
      surfaceContainer: Color(0xff1f2021),
      surfaceContainerHigh: Color(0xff2a2a2b),
      surfaceContainerHighest: Color(0xff343536),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffafaff),
      surfaceTint: Color(0xffbac8da),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbeccde),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffafaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc7cbd3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdac4da),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131314),
      onBackground: Color(0xffe4e2e3),
      surface: Color(0xff131314),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff44474c),
      onSurfaceVariant: Color(0xfffafaff),
      outline: Color(0xffc8cbd0),
      outlineVariant: Color(0xffc8cbd0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e3),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff1e2b39),
      primaryFixed: Color(0xffdae8fb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbeccde),
      onPrimaryFixedVariant: Color(0xff091724),
      secondaryFixed: Color(0xffe3e7ef),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc7cbd3),
      onSecondaryFixedVariant: Color(0xff12171c),
      tertiaryFixed: Color(0xfff7e0f7),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffdac4da),
      onTertiaryFixedVariant: Color(0xff1e1221),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff39393a),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1b1c1d),
      surfaceContainer: Color(0xff1f2021),
      surfaceContainerHigh: Color(0xff2a2a2b),
      surfaceContainerHighest: Color(0xff343536),
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
