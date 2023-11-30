import 'package:flutter/material.dart';

class FontUtils {
  static TextStyle getfontStyle({
    Color? color,
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
        fontFamily: fontFamily ?? 'Manrope',
        fontSize: fontSize ?? 49.0,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height ?? 1.37,
        letterSpacing: letterSpacing ?? 0.0,
        color: color ?? Color.fromRGBO(17, 17, 17, 1));
  }

  // Add more methods for other common text styles as needed
}
