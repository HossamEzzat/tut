import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle getStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: FontsManager.fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

//regular style
TextStyle getRegularStyle(double fontSize, Color color) {
  return getStyle(fontSize, color, FontWeights.regular);
}

//medium style
TextStyle getMediumStyle(double fontSize, Color color) {
  return getStyle(fontSize, color, FontWeights.medium);
}

//semiBold style
TextStyle getSemiBoldStyle(double fontSize, Color color) {
  return getStyle(fontSize, color, FontWeights.semiBold);
}

//bold style
TextStyle getBoldStyle(double fontSize, Color color) {
  return getStyle(fontSize, color, FontWeights.bold);
}

// light style
TextStyle getLightStyle(double fontSize, Color color) {
  return getStyle(fontSize, color, FontWeights.light);
}
