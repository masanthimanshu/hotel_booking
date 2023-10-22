import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.mooliTextTheme(),
  appBarTheme: const AppBarTheme(
    toolbarHeight: 80,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.black),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
    ),
  ),
);
