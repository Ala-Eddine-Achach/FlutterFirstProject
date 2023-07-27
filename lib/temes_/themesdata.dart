import 'package:flutter/material.dart';
ThemeData lightmode=ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.purple,
  primaryColor: Colors.deepPurple,

  scaffoldBackgroundColor: Colors.deepPurple[100],
  fontFamily: 'Montserrat', //3
  buttonTheme: ButtonThemeData( // 4
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    buttonColor: Colors.black87,
    ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.purple[300],
  )
);
ThemeData darkmode=ThemeData(
    brightness: Brightness.dark,
    hintColor: Colors.black,
    primarySwatch: Colors.purple,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Color.fromRGBO(35, 25, 45, 50),
    fontFamily: 'Montserrat', //3
    buttonTheme: ButtonThemeData( // 4
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
     buttonColor: Colors.lightBlueAccent,
),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[900],
      foregroundColor: Colors.cyanAccent[100],

    )

);