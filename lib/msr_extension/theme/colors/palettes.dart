import 'package:flutter/material.dart';

// WARNING: do not use those colors directly in code
// 1st level color definition
// each color used by app should be defined here
// each color comes tonal palette consisting of thirteen tones, including white and black
// tones from palettes defined here are selected in higher level definitions by assigning specific tone to role
//
// if you add new palette remember to add it to MSTPalettes.allPalettes
class MSRPalettesV3 {
  //Brand colors
  static final MaterialColor black = _createTonalPalette(
    const Color(0xff000000),
  );
  static final MaterialColor mint = _createTonalPalette(
    const Color(0xff4bbbbd),
  );
  static final MaterialColor purple = _createTonalPalette(
    const Color(0xffb44492),
  );

  //Custom colors
  static final MaterialColor successGreen = _createTonalPalette(
    const Color(0xFF44B466),
  );
  static final MaterialColor warningOrange = _createTonalPalette(
    const Color(0xFFFF9F1C),
  );

  static final MaterialColor infoBlue = _createTonalPalette(
    const Color(0xFF445AB4),
  );

  static final MaterialColor golden = _createTonalPalette(
    const Color.fromARGB(255, 246, 148, 44),
  );

  static final allPalettes = [
    black,
    mint,
    purple,
    infoBlue,
    successGreen,
    warningOrange,
    golden,
  ];

  //tone values defined by material https://m3.material.io/styles/color/the-color-system/key-colors-tones
  static const paletteToneStrengths = <double>[
    0,
    0.05,
    0.1,
    0.15,
    0.2,
    0.25,
    0.3,
    0.4,
    0.45,
    0.50,
    0.6,
    0.7,
    0.8,
    0.85,
    0.9,
    0.93,
    .95,
    0.96,
    .97,
    0.98,
    0.99,
    1,
  ];

  static MaterialColor _createTonalPalette(Color sourceColor) {
    if (sourceColor.red == sourceColor.green && sourceColor.green == sourceColor.blue) {
      final swatch = <int, Color>{};
      for (final strength in paletteToneStrengths) {
        final lightness = strength * 255;
        swatch[(strength * 1000).round()] =
            Color.fromARGB(255, lightness.round(), lightness.round(), lightness.round());
      }
      return MaterialColor(sourceColor.value, swatch);
    }
    final hslColor = HSLColor.fromColor(sourceColor);
    final swatch = <int, Color>{};
    for (final strength in paletteToneStrengths) {
      swatch[(strength * 1000).round()] = hslColor.withLightness(strength).toColor();
    }
    return MaterialColor(sourceColor.value, swatch);
  }
}
