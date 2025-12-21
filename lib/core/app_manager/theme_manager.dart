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
      shape: const StadiumBorder(),
      disabledColor: ColosManager.grey1,
      buttonColor: ColosManager.primaryColor,
      splashColor: ColosManager.lightPrimary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(FontSize.s17, ColosManager.white),
        backgroundColor: ColosManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(FontSize.s16, ColosManager.darkGrey),
      headlineLarge: getSemiBoldStyle(FontSize.s16, ColosManager.darkGrey),
      headlineMedium: getRegularStyle(FontSize.s14, ColosManager.darkGrey),
      titleMedium: getMediumStyle(FontSize.s16, ColosManager.primaryColor),
      bodyLarge: getRegularStyle(FontSize.s14, ColosManager.grey),
      bodyMedium: getRegularStyle(FontSize.s12, ColosManager.grey1),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(FontSize.s14, ColosManager.grey1),
      labelStyle: getMediumStyle(FontSize.s14, ColosManager.darkGrey),
      errorStyle: getRegularStyle(FontSize.s14, ColosManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColosManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColosManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColosManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColosManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
