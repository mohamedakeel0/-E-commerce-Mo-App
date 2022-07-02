

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/shared/style/colors.dart';
import 'package:hexcolor/hexcolor.dart';









ThemeData lightTheme=ThemeData(
primarySwatch: Colors.orange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultcolor,
    ),
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        elevation: 0.0,

        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:defaultcolor,
    statusBarBrightness: Brightness.light),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultcolor,
        unselectedItemColor: Colors.black45,
        elevation: 30),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black)),
    fontFamily: 'Schyler',
    scaffoldBackgroundColor: Colors.white);