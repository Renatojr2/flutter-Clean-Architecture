import 'package:flutter/material.dart';

import '../../ui/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(136, 14, 79, 1);
    final primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
    final primaryColorLigth = Color.fromRGBO(100, 71, 123, 1);
    return MaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLigth,
        accentColor: primaryColor,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: primaryColorDark,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColorLigth)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          alignLabelWithHint: true,
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            primary: primaryColor,
          ),
          buttonColor: primaryColor,
          splashColor: primaryColorLigth,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: LoginPage(
        presenter: null,
      ),
    );
  }
}
