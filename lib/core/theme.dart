import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: bgColor,

  appBarTheme: const AppBarTheme(color: bgColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          minimumSize: Size(100, 50),
          side: BorderSide(color: placeHolder, width: 1))),
  primarySwatch: Colors.blue,
  fontFamily: 'Montserrat',
  //scaffoldBackgroundColor: bgColor,
  textTheme: TextTheme(
      headline1: TextStyle(
          color: blueColor,
          fontSize: 37,
          fontWeight: FontWeight.w800,
          fontFamily: 'Montserrat'),
      headline2: TextStyle(
          color: blueColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: 'Montserrat'),
      headline3: TextStyle(
          color: blueColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat'),
      headline4: TextStyle(
          color: blueColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat'),
      headline5: TextStyle(
          color: blueColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat'),
      subtitle2: TextStyle(
        color: fontPlaceHolderColor,
        fontSize: 13,
      ),
      subtitle1: TextStyle(
        color: fontPlaceHolderColor,
        fontSize: 22,
      )),
);
