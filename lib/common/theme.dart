import 'package:flutter/material.dart';

import 'constants_color.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kbackgroundColor,
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      appBarTheme: appBarTheme);
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kDarkColor,
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      // on utilise copywith pour ecraser les couleurs qu'on n'avait 
      // defini pour notre appBarTheme en quelque sorte changer l'instance
      appBarTheme: appBarTheme.copyWith(
        backgroundColor: kDarkColor,
        iconTheme: IconThemeData(color: kWhiteColor)
      )
    );
}

const appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  backgroundColor: kWhiteColor,
  iconTheme: IconThemeData(color: kPrimaryColor),
  titleTextStyle:
      TextStyle(color: kDarkColor, fontSize: 25, fontWeight: FontWeight.bold),
);
