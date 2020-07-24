import 'package:flutter/material.dart';

extension XContext on BuildContext {
  MediaQueryData get mediaQury => MediaQuery.of(this);
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get smallHeight => height * 0.01;
  double get mediumHeight => height * 0.05;
  double get largeHeight => height * 0.1;
  double get smallWidth => width * 0.05;
  double get mediumWidth => width * 0.1;
  double get largeWidth => width * 0.15;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  EdgeInsets get paddingLow =>
      EdgeInsets.symmetric(vertical: smallHeight, horizontal: smallWidth);
  EdgeInsets get paddingMedium =>
      EdgeInsets.symmetric(vertical: mediumHeight, horizontal: largeWidth);
  EdgeInsets get paddingHigh =>
      EdgeInsets.symmetric(vertical: largeHeight, horizontal: largeWidth);
}
