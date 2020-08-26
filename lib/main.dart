import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabezo_web/screens/screens.dart';
import 'config/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabezo Ichikawa\'s homepage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: GoogleFonts.josefinSans(
              fontSize: 123, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.josefinSans(
              fontSize: 77, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: GoogleFonts.josefinSans(
              fontSize: 61, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.josefinSans(
              fontSize: 43, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: GoogleFonts.josefinSans(
              fontSize: 31, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.josefinSans(
              fontSize: 26, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.josefinSans(
              fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.josefinSans(
              fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.roboto(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ).apply(
          bodyColor: Palette.tabezoBlue,
          displayColor: Palette.tabezoBlue,
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/home': (BuildContext context) => HomeScreen(),
        '/about': (BuildContext context) => AboutScreen(),
      },
    );
  }
}
