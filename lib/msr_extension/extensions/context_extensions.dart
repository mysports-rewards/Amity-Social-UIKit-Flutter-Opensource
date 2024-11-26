import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  /// Theme
  ThemeData get msrMaterialTheme => Theme.of(this);
  ColorScheme get msrMaterialColorScheme => msrMaterialTheme.colorScheme;
  TextTheme get msrMaterialTextTheme => msrMaterialTheme.textTheme;
  bool get isDarkModeExt => msrMaterialTheme.brightness == Brightness.dark;

  /// Locale
  String get locale => Localizations.localeOf(this).toString();
  String get localeLg => Localizations.localeOf(this).languageCode;
  bool get weekStartsOnSunday => MaterialLocalizations.of(this).firstDayOfWeekIndex == 0;

  /// current Screen Width
  double get widthWithoutMargin => MediaQuery.sizeOf(this).width - 32;

  /// Platform
  TargetPlatform get targetPlatform => Theme.of(this).platform;
}
