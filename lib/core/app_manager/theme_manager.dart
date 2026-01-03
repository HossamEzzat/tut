import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/fonts_manager.dart';
import 'package:tut/core/app_manager/styels_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';

import 'colos_manager.dart';

ThemeData getThemeMode() {
  return ThemeData(
    //main colors
    primaryColor: ColorsManager.primaryColor,
    primaryColorDark: ColorsManager.darkPrimary,
    primaryColorLight: ColorsManager.lightPrimary,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.primaryColor,

    //card view theme
    cardTheme: CardThemeData(
      color: ColorsManager.white,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(AppMargin.m16),
      shadowColor: ColorsManager.grey,
    ),
    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorsManager.lightPrimary,
      iconTheme: IconThemeData(color: ColorsManager.white),
      titleTextStyle: getRegularStyle(FontSize.s16, ColorsManager.white),
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.grey1,
      buttonColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.lightPrimary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(FontSize.s17, ColorsManager.white),
        backgroundColor: ColorsManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(FontSize.s16, ColorsManager.darkGrey),
      headlineLarge: getSemiBoldStyle(FontSize.s16, ColorsManager.darkGrey),
      headlineMedium: getRegularStyle(FontSize.s14, ColorsManager.darkGrey),
      titleMedium: getMediumStyle(FontSize.s16, ColorsManager.primaryColor),
      bodyLarge: getRegularStyle(FontSize.s14, ColorsManager.grey),
      bodyMedium: getRegularStyle(FontSize.s12, ColorsManager.grey1),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(FontSize.s14, ColorsManager.grey1),
      labelStyle: getMediumStyle(FontSize.s14, ColorsManager.darkGrey),
      errorStyle: getRegularStyle(FontSize.s14, ColorsManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primaryColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
