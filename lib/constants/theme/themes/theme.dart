import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281348644),
      surfaceTint: Color(4284440399),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283651140),
      onPrimaryContainer: Color(4294374880),
      secondary: Color(4284440407),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293519325),
      onSecondaryContainer: Color(4283124547),
      tertiary: Color(4280890156),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283127117),
      onTertiaryContainer: Color(4293720045),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294834678),
      onBackground: Color(4280032026),
      surface: Color(4294834678),
      onSurface: Color(4280032026),
      surfaceVariant: Color(4293256152),
      onSurfaceVariant: Color(4282861375),
      outline: Color(4286084974),
      outlineVariant: Color(4291413948),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413679),
      inverseOnSurface: Color(4294242541),
      inversePrimary: Color(4291348660),
      primaryFixed: Color(4293190863),
      onPrimaryFixed: Color(4279966736),
      primaryFixedDim: Color(4291348660),
      onPrimaryFixedVariant: Color(4282861625),
      secondaryFixed: Color(4293256152),
      onSecondaryFixed: Color(4280032278),
      secondaryFixedDim: Color(4291413949),
      onSecondaryFixedVariant: Color(4282861376),
      tertiaryFixed: Color(4292535771),
      onTertiaryFixed: Color(4279508504),
      tertiaryFixedDim: Color(4290693568),
      onTertiaryFixedVariant: Color(4282337602),
      surfaceDim: Color(4292729303),
      surfaceBright: Color(4294834678),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439920),
      surfaceContainer: Color(4294045162),
      surfaceContainerHigh: Color(4293650405),
      surfaceContainerHighest: Color(4293255903),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281348644),
      surfaceTint: Color(4284440399),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283651140),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282598204),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285953389),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280890156),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283127117),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294834678),
      onBackground: Color(4280032026),
      surface: Color(4294834678),
      onSurface: Color(4280032026),
      surfaceVariant: Color(4293256152),
      onSurfaceVariant: Color(4282598203),
      outline: Color(4284505943),
      outlineVariant: Color(4286348146),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413679),
      inverseOnSurface: Color(4294242541),
      inversePrimary: Color(4291348660),
      primaryFixed: Color(4285888100),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284243277),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285953389),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284308564),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285364079),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283719255),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729303),
      surfaceBright: Color(4294834678),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439920),
      surfaceContainer: Color(4294045162),
      surfaceContainerHigh: Color(4293650405),
      surfaceContainerHighest: Color(4293255903),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280427286),
      surfaceTint: Color(4284440399),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282598453),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280427292),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282598204),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279968798),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282074430),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294834678),
      onBackground: Color(4280032026),
      surface: Color(4294834678),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293256152),
      onSurfaceVariant: Color(4280558621),
      outline: Color(4282598203),
      outlineVariant: Color(4282598203),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413679),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4293848536),
      primaryFixed: Color(4282598453),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281151008),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282598204),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281150758),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282074430),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280626985),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729303),
      surfaceBright: Color(4294834678),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439920),
      surfaceContainer: Color(4294045162),
      surfaceContainerHigh: Color(4293650405),
      surfaceContainerHighest: Color(4293255903),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291348660),
      surfaceTint: Color(4291348660),
      onPrimary: Color(4281348387),
      primaryContainer: Color(4281940524),
      onPrimaryContainer: Color(4291611832),
      secondary: Color(4291413949),
      onSecondary: Color(4281413930),
      secondaryContainer: Color(4282335032),
      onSecondaryContainer: Color(4292269258),
      tertiary: Color(4290693568),
      onTertiary: Color(4280890156),
      tertiaryContainer: Color(4281416500),
      onTertiaryContainer: Color(4290956740),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279505682),
      onBackground: Color(4293255903),
      surface: Color(4279505682),
      onSurface: Color(4293255903),
      surfaceVariant: Color(4282861375),
      onSurfaceVariant: Color(4291413948),
      outline: Color(4287795591),
      outlineVariant: Color(4282861375),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255903),
      inverseOnSurface: Color(4281413679),
      inversePrimary: Color(4284440399),
      primaryFixed: Color(4293190863),
      onPrimaryFixed: Color(4279966736),
      primaryFixedDim: Color(4291348660),
      onPrimaryFixedVariant: Color(4282861625),
      secondaryFixed: Color(4293256152),
      onSecondaryFixed: Color(4280032278),
      secondaryFixedDim: Color(4291413949),
      onSecondaryFixedVariant: Color(4282861376),
      tertiaryFixed: Color(4292535771),
      onTertiaryFixed: Color(4279508504),
      tertiaryFixedDim: Color(4290693568),
      onTertiaryFixedVariant: Color(4282337602),
      surfaceDim: Color(4279505682),
      surfaceBright: Color(4282005815),
      surfaceContainerLowest: Color(4279111181),
      surfaceContainerLow: Color(4280032026),
      surfaceContainer: Color(4280295454),
      surfaceContainerHigh: Color(4281018920),
      surfaceContainerHighest: Color(4281677107),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4291611832),
      surfaceTint: Color(4291348660),
      onPrimary: Color(4279637771),
      primaryContainer: Color(4287795840),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291677121),
      onSecondary: Color(4279637777),
      secondaryContainer: Color(4287795592),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291022276),
      onTertiary: Color(4279179283),
      tertiaryContainer: Color(4287206283),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279505682),
      onBackground: Color(4293255903),
      surface: Color(4279505682),
      onSurface: Color(4294900471),
      surfaceVariant: Color(4282861375),
      onSurfaceVariant: Color(4291677120),
      outline: Color(4288979865),
      outlineVariant: Color(4286874490),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255903),
      inverseOnSurface: Color(4281018920),
      inversePrimary: Color(4282927418),
      primaryFixed: Color(4293190863),
      onPrimaryFixed: Color(4279308807),
      primaryFixedDim: Color(4291348660),
      onPrimaryFixedVariant: Color(4281743145),
      secondaryFixed: Color(4293256152),
      onSecondaryFixed: Color(4279308812),
      secondaryFixedDim: Color(4291413949),
      onSecondaryFixedVariant: Color(4281808688),
      tertiaryFixed: Color(4292535771),
      onTertiaryFixed: Color(4278850318),
      tertiaryFixedDim: Color(4290693568),
      onTertiaryFixedVariant: Color(4281284658),
      surfaceDim: Color(4279505682),
      surfaceBright: Color(4282005815),
      surfaceContainerLowest: Color(4279111181),
      surfaceContainerLow: Color(4280032026),
      surfaceContainer: Color(4280295454),
      surfaceContainerHigh: Color(4281018920),
      surfaceContainerHighest: Color(4281677107),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294835430),
      surfaceTint: Color(4291348660),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291611832),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294835184),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291677121),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294180595),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291022276),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279505682),
      onBackground: Color(4293255903),
      surface: Color(4279505682),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282861375),
      onSurfaceVariant: Color(4294835183),
      outline: Color(4291677120),
      outlineVariant: Color(4291677120),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255903),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4280953629),
      primaryFixed: Color(4293519571),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291611832),
      onPrimaryFixedVariant: Color(4279637771),
      secondaryFixed: Color(4293519325),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291677121),
      onSecondaryFixedVariant: Color(4279637777),
      tertiaryFixed: Color(4292864736),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291022276),
      onTertiaryFixedVariant: Color(4279179283),
      surfaceDim: Color(4279505682),
      surfaceBright: Color(4282005815),
      surfaceContainerLowest: Color(4279111181),
      surfaceContainerLow: Color(4280032026),
      surfaceContainer: Color(4280295454),
      surfaceContainerHigh: Color(4281018920),
      surfaceContainerHighest: Color(4281677107),
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
