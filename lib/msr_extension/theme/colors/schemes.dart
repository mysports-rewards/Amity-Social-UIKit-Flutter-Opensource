import 'package:amity_uikit_beta_service/msr_extension/theme/colors/custom_colors.dart';
import 'package:amity_uikit_beta_service/msr_extension/theme/colors/palettes.dart';
import 'package:flutter/material.dart';

// WARNING: do not use those colors directly in code
// 2nd level color definition
// key colors
final primaryKeyColor = MSRPalettesV3.black;
final secondaryKeyColor = MSRPalettesV3.black;
final tertiaryKeyColor = MSRPalettesV3.mint;

final neutralKeyColor = MSRPalettesV3.black;
final neutralVariantKeyColor = MSRPalettesV3.black;

final outlineKeyColor = MSRPalettesV3.black;

// custom colors
final tertiaryVariantKeyColor = MSRPalettesV3.purple;
final stepsKeyColor = MSRPalettesV3.mint;
final cyclingKeyColor = MSRPalettesV3.purple;
final studioKeyColor = MSRPalettesV3.infoBlue;
final goldenKeyColor = MSRPalettesV3.golden;
final demoWalletColor = MSRPalettesV3.purple;
// feedback
final successKeyColor = MSRPalettesV3.successGreen;
final warningKeyColor = MSRPalettesV3.warningOrange;
final informationKeyColor = MSRPalettesV3.infoBlue;

final lightColorScheme = ColorScheme.light(
  primary: primaryKeyColor,
  onPrimary: primaryKeyColor[990]!,
  primaryContainer: primaryKeyColor[900],
  onPrimaryContainer: primaryKeyColor[400],
  secondary: secondaryKeyColor,
  onSecondary: secondaryKeyColor[900]!,
  secondaryContainer: secondaryKeyColor[900],
  onSecondaryContainer: secondaryKeyColor[400],
  tertiary: tertiaryKeyColor[500],
  onTertiary: tertiaryKeyColor[950],
  tertiaryContainer: tertiaryKeyColor[850],
  onTertiaryContainer: tertiaryKeyColor[400],
  surface: neutralKeyColor[960]!,
  onSurface: neutralKeyColor[100]!,
  surfaceContainerHighest: neutralKeyColor[1000],
  surfaceContainerHigh: neutralKeyColor[990],
  surfaceContainer: neutralKeyColor[980],
  surfaceContainerLow: neutralKeyColor[970],
  surfaceContainerLowest: neutralKeyColor[960],
  onSurfaceVariant: neutralVariantKeyColor[300],
  outline: outlineKeyColor[400],
  outlineVariant: outlineKeyColor[800],
);

final customColorsLight = CustomColorsV3(
  steps: stepsKeyColor,
  cycling: cyclingKeyColor,
  studio: studioKeyColor,
  success: successKeyColor,
  warning: warningKeyColor,
  warningContainer: warningKeyColor[950]!,
  onWarningContainer: warningKeyColor[400]!,
  information: informationKeyColor,
  star: goldenKeyColor,
  winnerCup: goldenKeyColor,
);

final customColorsDark = customColorsLight.copyWith();

final darkColorScheme = ColorScheme.dark(
  primary: primaryKeyColor[990]!,
  onPrimary: primaryKeyColor,
  primaryContainer: primaryKeyColor[400],
  onPrimaryContainer: primaryKeyColor[900],
  secondary: secondaryKeyColor[900]!,
  onSecondary: secondaryKeyColor,
  onSecondaryContainer: secondaryKeyColor[900],
  secondaryContainer: secondaryKeyColor[400],
  tertiary: tertiaryKeyColor,
  onTertiary: tertiaryKeyColor[150],
  tertiaryContainer: tertiaryKeyColor[300],
  onTertiaryContainer: tertiaryKeyColor[900],
  surface: neutralKeyColor[0]!,
  surfaceContainerHighest: neutralKeyColor[300],
  surfaceContainerHigh: neutralKeyColor[250],
  surfaceContainer: neutralKeyColor[200],
  surfaceContainerLow: neutralKeyColor[150],
  surfaceContainerLowest: neutralKeyColor[100],
  outline: outlineKeyColor[1000],
  outlineVariant: outlineKeyColor[500],
);

final demoWalletLightTheme = lightColorScheme.copyWith(
  tertiary: demoWalletColor[500],
  onTertiary: demoWalletColor[950],
  tertiaryContainer: demoWalletColor[800],
  onTertiaryContainer: demoWalletColor[250],
);

final demoWalletDarkTheme = darkColorScheme.copyWith(
  tertiary: demoWalletColor[700],
  onTertiary: demoWalletColor[150],
  tertiaryContainer: demoWalletColor[300],
  onTertiaryContainer: demoWalletColor[900],
);
