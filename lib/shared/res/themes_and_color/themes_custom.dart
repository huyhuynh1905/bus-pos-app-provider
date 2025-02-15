import 'package:bus_pos_app/shared/res/themes_and_color/app_themes.dart';
import 'package:flutter/material.dart';

abstract class AppThemesColors {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onTertiary;
  final Color onError;
  final Color primaryContainer;
  final Color secondaryContainer;
  final Color tertiaryContainer;
  final Color errorContainer;
  final Color onPrimaryContainer;
  final Color onSecondaryContainer;
  final Color onTertiaryContainer;
  final Color onErrorContainer;
  final Color surfaceDim;
  final Color surface;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color onSurface;
  final Color onSurfaceVar;
  final Color outline;
  final Color outlineVar;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color scrim;
  final Color shadow;

  AppThemesColors({
      required this.primary,
      required this.secondary,
      required this.tertiary,
      required this.error,
      required this.onPrimary,
      required this.onSecondary,
      required this.onTertiary,
      required this.onError,
      required this.primaryContainer,
      required this.secondaryContainer,
      required this.tertiaryContainer,
      required this.errorContainer,
      required this.onPrimaryContainer,
      required this.onSecondaryContainer,
      required this.onTertiaryContainer,
      required this.onErrorContainer,
      required this.surfaceDim,
      required this.surface,
      required this.surfaceBright,
      required this.surfaceContainerLowest,
      required this.surfaceContainerLow,
      required this.surfaceContainer,
      required this.surfaceContainerHigh,
      required this.surfaceContainerHighest,
      required this.onSurface,
      required this.onSurfaceVar,
      required this.outline,
      required this.outlineVar,
      required this.inverseSurface,
      required this.inverseOnSurface,
      required this.inversePrimary,
      required this.scrim,
      required this.shadow});

  static late AppThemesColors current;

  static AppThemesColors of(BuildContext context) {
    final appThemes = Theme.of(context).appThemes;

    current = appThemes;

    return current;
  }

}