import 'package:flutter/material.dart';
import 'package:flutter_bmi/screens/inputpage.dart';
//import 'package:flutter_bmi/screens/resultpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E101C),
        accentColor: Color(0xFFEA2E4D),
        scaffoldBackgroundColor: Color(0xFF16171B),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
      routes: {
        '/': (context) => InputPage(),
        //'/resultado': (context) => ResultPage(),
      },
    );
  }
}
