import 'package:flutter/material.dart';

// Each custom color should be defined in this class
// TODO(kdorzak): we should consider following material rules & use 4 tones per custom color as in
// https://m3.material.io/styles/color/the-color-system/custom-colors
class CustomColorsV3 extends ThemeExtension<CustomColorsV3> {
  const CustomColorsV3({
    required this.steps,
    required this.cycling,
    required this.studio,
    required this.success,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.information,
    required this.star,
    required this.winnerCup,
  });

  final Color steps;
  final Color cycling;
  final Color studio;
  final Color success;
  final Color warning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color information;
  final Color star;
  final Color winnerCup;

  @override
  ThemeExtension<CustomColorsV3> copyWith({
    Color? steps,
    Color? cycling,
    Color? studio,
    Color? success,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? information,
    Color? star,
    Color? winnerCup,
  }) {
    return CustomColorsV3(
      steps: steps ?? this.steps,
      cycling: cycling ?? this.cycling,
      studio: studio ?? this.studio,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      information: information ?? this.information,
      star: star ?? this.star,
      winnerCup: winnerCup ?? this.winnerCup,
    );
  }

  @override
  ThemeExtension<CustomColorsV3> lerp(ThemeExtension<CustomColorsV3>? other, double t) {
    if (other is! CustomColorsV3) {
      return this;
    }
    return CustomColorsV3(
      steps: Color.lerp(steps, other.steps, t)!,
      cycling: Color.lerp(cycling, other.cycling, t)!,
      studio: Color.lerp(studio, other.studio, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      information: Color.lerp(information, other.information, t)!,
      star: Color.lerp(star, other.star, t)!,
      winnerCup: Color.lerp(winnerCup, other.winnerCup, t)!,
    );
  }
}
