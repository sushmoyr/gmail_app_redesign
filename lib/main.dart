import 'package:flutter/material.dart';
import 'package:gmail_app_redesign/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme:
            GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.white),
      ),
      home: MainScreen(),
    );
  }
}

/*TextTheme appTextTheme = TextTheme(
  headline1: GoogleFonts.dancingScript(color: Colors.white),
  headline2: GoogleFonts.dancingScript(color: Colors.white),
  headline3: GoogleFonts.dancingScript(color: Colors.white),
  headline4: GoogleFonts.dancingScript(color: Colors.white),
  headline5: GoogleFonts.dancingScript(color: Colors.white),
  bodyText1: GoogleFonts.dancingScript(color: Colors.white),
  bodyText2: GoogleFonts.dancingScript(color: Colors.white),
);*/
