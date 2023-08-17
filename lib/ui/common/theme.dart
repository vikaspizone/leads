import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData leadsAppTheme() {
  return ThemeData(
    fontFamily: "Nexa-Bold",
    primaryColor: appColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 55, 172, 255),
        background: Colors.white),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 34,
          color: Color.fromARGB(255, 3, 116, 237)),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    }),
  );
}
