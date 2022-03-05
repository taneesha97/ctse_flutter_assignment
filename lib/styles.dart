// Common Style file.
import 'package:flutter/material.dart';



class Styles {

  // Section Attributes.
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 18.0;
  static const BodyTextSize =  16.0;
  static const subBodyTextSize =  12.0;
  static const String FontNameDefault = "Raleway";

  // Screen Header Attributes.
  static final headerOfScreenSize = 30.0;
  static final subHeaderOfScreenSize = 26.0;

  static final Color primaryThemeColor =_hexToColor("0DD6E3");
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('000000');
  static final Color _textColorFaint = _hexToColor('999999');
  static final Color textColorBright = _hexToColor('FFFFFF');
  static final Color accentColor = _hexToColor('FF0000');
  static final Color indexPurple = _hexToColor('7F26FDFF');

  static final navBarTitle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w800,
    fontSize: MediumTextSize,
    color: textColorBright,
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

  static final textSectionSubBody = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    fontSize: subBodyTextSize,
    color: _hexToColor('000000'),
  );

  static final screenHeader = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.w600,
    fontSize: headerOfScreenSize,
    color: _hexToColor('000000'),
  );

  static final screenSubHeader = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.w300,
    fontSize: subHeaderOfScreenSize,
    color: _hexToColor('000000'),
  );

  // Movie Single Page - Stylings

  /// Over the Image Title.
  static final overTheImageTitle = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.w600,
    fontSize: 30,
    fontStyle: FontStyle.italic,
    color: textColorBright,
  );

  static final overTheImageSubTitle = TextStyle(
    fontFamily: "Raleway",
    fontWeight: FontWeight.w300,
    fontSize: 20,
    fontStyle: FontStyle.italic,
    color: textColorBright,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}