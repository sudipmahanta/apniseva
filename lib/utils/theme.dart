import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
      ),
      displayMedium: TextStyle(),
      displaySmall: TextStyle(),

      headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),

      titleLarge: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
      titleMedium: TextStyle(
        fontSize: 10,
        color: Colors.grey,
      ),
      titleSmall: TextStyle(
        fontSize: 8,
        color: Colors.grey,
      )
    ),

    iconTheme: IconThemeData(
      color: primaryColor
    ),

    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.all(20.0),
      hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.6,
          fontSize: 11.0
      ),
      prefixIconColor: primaryColor,
      enabledBorder:  const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0XFF999999)),
        borderRadius: BorderRadius.all( Radius.circular(7.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: Color(0XFF999999)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    
    cardTheme: CardTheme(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7)
      )
    )
    
  );
}
