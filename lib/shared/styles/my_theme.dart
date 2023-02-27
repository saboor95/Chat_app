import 'package:flutter/material.dart';
import 'colors.dart';

class MyThemeData{


  static ThemeData lightTheme = ThemeData(
    primaryColor:primaryColor ,
    scaffoldBackgroundColor: greenBackground,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary:Colors.white,
      secondary:greenBackground,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.green,
      onBackground:primaryColor,
      surface: Colors.grey,
      onSurface: colorBlack,
    ),
      appBarTheme:AppBarTheme(
        iconTheme: IconThemeData(color: colorBlack),
        backgroundColor: primaryColor,
      ) ,
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,),
        subtitle1: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        subtitle2: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorGreen,
      ),),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: primaryColor,
      selectedItemColor:  Colors.grey,
    ),

  );

  static ThemeData darkTheme = ThemeData(
    primaryColor:primaryDark ,
    scaffoldBackgroundColor: primaryDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryDark,
      onPrimary:Colors.white,
      secondary:colorGreen,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: primaryDark,
      onBackground:primaryColor,
      surface: primaryDark,
      onSurface: Colors.white,
    ),
    appBarTheme:AppBarTheme(
      iconTheme: IconThemeData(color: colorBlack),
      backgroundColor: primaryColor,
    ) ,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,),
      subtitle1: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: primaryColor),
      subtitle2: TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorGreen,
      ),),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: primaryColor,
      selectedItemColor:  Colors.grey,
    ),

  );


}