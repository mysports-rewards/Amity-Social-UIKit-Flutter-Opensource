import 'package:amity_uikit_beta_service/amity_uikit.dart';
import 'package:flutter/material.dart';

abstract class MSRTextTheme {
  static const _bodyFontFamily = 'Inter';
  static const _headersFontFamily = 'Inter';
  static const _displayFontFamily = 'Inter';

  static TextStyle? displayLarge(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.displayLarge?.copyWith(
        color: baseColor,
        fontSize: 57,
        height: 1.3,
        fontWeight: FontWeight.w800,
        fontFamily: _displayFontFamily,
      );

  static TextStyle? displayMedium(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.displayMedium?.copyWith(
        color: baseColor,
        fontSize: 45,
        height: 1.3,
        fontWeight: FontWeight.w800,
        fontFamily: _displayFontFamily,
      );

  static TextStyle? displaySmall(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.displaySmall?.copyWith(
        color: baseColor,
        fontSize: 36,
        height: 1.3,
        fontWeight: FontWeight.w800,
        fontFamily: _displayFontFamily,
      );
  static TextStyle? headlineLarge(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.headlineLarge?.copyWith(
        color: baseColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? headlineMedium(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.headlineMedium?.copyWith(
        color: baseColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? headlineSmall(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.headlineSmall?.copyWith(
        color: baseColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? titleLarge(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.titleLarge?.copyWith(
        color: baseColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? titleMedium(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.titleMedium?.copyWith(
        color: baseColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? titleSmall(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.titleSmall?.copyWith(
        color: baseColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? labelLarge(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.labelLarge?.copyWith(
        color: baseColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? labelMedium(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.labelMedium?.copyWith(
        color: baseColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? labelSmall(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.labelSmall?.copyWith(
        color: baseColor,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        fontFamily: _headersFontFamily,
      );
  static TextStyle? bodyLarge(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.bodyLarge?.copyWith(
        color: baseColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: _bodyFontFamily,
      );
  static TextStyle? bodyMedium(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.bodyMedium?.copyWith(
        color: baseColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: _bodyFontFamily,
      );

  static TextStyle? bodySmall(
    BuildContext context, {
    Color? baseColor,
  }) =>
      context.msrMaterialTextTheme.bodySmall?.copyWith(
        color: baseColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: _bodyFontFamily,
      );
  static TextTheme textTheme(
    BuildContext context, {
    Color? baseColor,
  }) =>
      TextTheme(
        displayLarge: displayLarge(
          context,
          baseColor: baseColor,
        ),
        displayMedium: displayMedium(
          context,
          baseColor: baseColor,
        ),
        displaySmall: displaySmall(
          context,
          baseColor: baseColor,
        ),
        headlineLarge: headlineLarge(
          context,
          baseColor: baseColor,
        ),
        headlineMedium: headlineMedium(
          context,
          baseColor: baseColor,
        ),
        headlineSmall: headlineSmall(
          context,
          baseColor: baseColor,
        ),
        titleLarge: titleLarge(
          context,
          baseColor: baseColor,
        ),
        titleMedium: titleMedium(
          context,
          baseColor: baseColor,
        ),
        titleSmall: titleSmall(
          context,
          baseColor: baseColor,
        ),
        labelLarge: labelLarge(
          context,
          baseColor: baseColor,
        ),
        labelMedium: labelMedium(
          context,
          baseColor: baseColor,
        ),
        labelSmall: labelSmall(
          context,
          baseColor: baseColor,
        ),
        bodyLarge: bodyLarge(
          context,
          baseColor: baseColor,
        ),
        bodyMedium: bodyMedium(
          context,
          baseColor: baseColor,
        ),
        bodySmall: bodySmall(
          context,
          baseColor: baseColor,
        ),
      );
}
