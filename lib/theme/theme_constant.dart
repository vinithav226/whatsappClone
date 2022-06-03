import 'package:flutter/material.dart';

const primarycolor = Colors.teal;
ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.teal,
        splashColor: Colors.green,
        elevation: 5,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primarycolor,
        secondary: Colors.green,
      ),
      indicatorColor: Colors.teal,
      iconTheme: const IconThemeData(
        color: Colors.green,
      ),
    ),
    darkTheme = ThemeData(
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
        splashColor: Colors.tealAccent,
      ),
      indicatorColor: Colors.teal,
      iconTheme: const IconThemeData(
        color: Colors.green,
      ),
    );
