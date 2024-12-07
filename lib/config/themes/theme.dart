
import 'package:flutter/material.dart';
import 'package:pannel_clone/config/themes/custom_themes/app_bar_theme.dart';
import 'package:pannel_clone/config/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:pannel_clone/config/themes/custom_themes/elevated_button_theme.dart';
import 'package:pannel_clone/config/themes/custom_themes/text_theme.dart';

class SAppTheme{
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevateButtonTheme,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme
  );
  

  static ThemeData darkTheme = ThemeData();

}