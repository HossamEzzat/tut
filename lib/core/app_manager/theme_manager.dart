import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/fonts_manager.dart';
import 'package:tut/core/app_manager/styels_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';

import 'colos_manager.dart';

ThemeData getThemeMode() {
  return ThemeData(
    //main colors
    primaryColor: ColosManager.primaryColor,
    primaryColorDark: ColosManager.darkPrimary,
    primaryColorLight: ColosManager.lightPrimary,
    disabledColor: ColosManager.grey1,
    splashColor: ColosManager.primaryColor,

    //card view theme
    cardTheme: CardThemeData(
      color: ColosManager.white,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(AppMargin.m16),
      shadowColor: ColosManager.grey,
    ),
    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColosManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColosManager.lightPrimary,
      iconTheme: IconThemeData(color: ColosManager.white),
      titleTextStyle: getRegularStyle(FontSize.s16, ColosManager.white),
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColosManager.primaryColor,
      disabledColor: ColosManager.grey1,
    ),
    //input decoration theme

    //text theme
  );
}
