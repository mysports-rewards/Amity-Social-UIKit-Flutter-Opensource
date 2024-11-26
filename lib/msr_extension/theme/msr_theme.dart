import 'package:amity_uikit_beta_service/amity_uikit.dart';
import 'package:amity_uikit_beta_service/msr_extension/theme/colors/schemes.dart';
import 'package:amity_uikit_beta_service/msr_extension/theme/typography/msr_text_styles.dart';
import 'package:flutter/material.dart';

class MsrAppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: MSRTextTheme.textTheme(
        context,
        baseColor: lightColorScheme.onSurface,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: lightColorScheme.tertiary,
        linearTrackColor: lightColorScheme.secondaryContainer,
        linearMinHeight: 6,
      ),
      dividerColor: lightColorScheme.outlineVariant,
      chipTheme: ChipThemeData(
        selectedColor: lightColorScheme.primary,
        labelStyle: context.msrMaterialTextTheme.labelLarge?.copyWith(
          color: lightColorScheme.primary,
        ),
        secondaryLabelStyle: context.msrMaterialTextTheme.labelLarge?.copyWith(
          color: lightColorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide(
          color: lightColorScheme.primaryContainer,
        ),
        showCheckmark: false,
        backgroundColor: lightColorScheme.primaryContainer,
      ),
      primaryTextTheme: MSRTextTheme.textTheme(context),
      extensions: <ThemeExtension<dynamic>>[customColorsLight],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((_) {
            return lightColorScheme.primary;
          }),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: lightColorScheme.surfaceContainerHighest,
        filled: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: lightColorScheme.primary.withOpacity(
            0.5,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: lightColorScheme.surfaceContainerHigh,
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
        overlayColor: WidgetStateProperty.all(
          lightColorScheme.secondaryContainer,
        ),
        iconTheme: WidgetStateProperty.all(
          IconThemeData(
            color: lightColorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  static ThemeData themeDataDark(BuildContext context) {
    final baseTheme = themeData(context);
    final textTheme = MSRTextTheme.textTheme(
      context,
      baseColor: darkColorScheme.onSurface,
    );
    return themeData(context).copyWith(
      colorScheme: darkColorScheme,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[customColorsDark],
      scaffoldBackgroundColor: darkColorScheme.surface,
      chipTheme: baseTheme.chipTheme.copyWith(
        selectedColor: darkColorScheme.primary,
        labelStyle: context.msrMaterialTextTheme.labelLarge?.copyWith(
          color: darkColorScheme.primary,
        ),
        secondaryLabelStyle: context.msrMaterialTextTheme.labelLarge?.copyWith(
          color: darkColorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide(
          color: darkColorScheme.primaryContainer,
        ),
        showCheckmark: false,
        backgroundColor: darkColorScheme.surfaceContainerHighest,
      ),
      dividerColor: darkColorScheme.outlineVariant,
      dividerTheme: const DividerThemeData(
        thickness: .5,
      ),
      disabledColor: darkColorScheme.outlineVariant,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((_) {
            return darkColorScheme.tertiary;
          }),
        ),
      ),
      progressIndicatorTheme: baseTheme.progressIndicatorTheme.copyWith(
        color: darkColorScheme.tertiary,
        linearTrackColor: darkColorScheme.secondaryContainer,
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        fillColor: darkColorScheme.surfaceContainerHighest,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: darkColorScheme.primary.withOpacity(
            0.5,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: darkColorScheme.surfaceContainerHigh,
      ),
      navigationBarTheme: baseTheme.navigationBarTheme.copyWith(
        backgroundColor: darkColorScheme.surfaceContainerLowest,
        indicatorColor: darkColorScheme.secondaryContainer,
        overlayColor: WidgetStateProperty.all(
          darkColorScheme.secondaryContainer,
        ),
        iconTheme: WidgetStateProperty.all(
          IconThemeData(
            color: darkColorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  static ThemeData demoWalletThemeData(BuildContext context) {
    return context.msrMaterialTheme.copyWith(
      colorScheme: context.isDarkModeExt ? demoWalletDarkTheme : demoWalletLightTheme,
    );
  }
}
