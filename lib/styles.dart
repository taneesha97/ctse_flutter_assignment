// Common Style file.
import 'package:flutter/material.dart';


const String FontNameDefault = "Raleway";
class Styles {

  static const LargeTextSize = 26.0;
  static const MediumTextSize = 20.0;
  static const BodyTextSize =  16.0;

  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('000000');
  static final Color _textColorFaint = _hexToColor('999999');
  static final Color textColorBright = _hexToColor('FFFFFF');
  static final Color accentColor = _hexToColor('FF0000');

  static final navBarTitle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w800,
    fontSize: MediumTextSize,
    color: _textColorDefault,
  );

  static final textSectionHeader = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    fontSize: MediumTextSize,
    color: _hexToColor('000000'),
  );

  static final textSectionBody = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    fontSize: BodyTextSize,
    color: _hexToColor('000000'),
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}