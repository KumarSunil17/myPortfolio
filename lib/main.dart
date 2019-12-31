import 'package:flutter/material.dart';
import 'package:my_profile_website/pages/Dashboard_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
          fontFamily: 'KulimPark',
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF2D2D2D),
          primaryColorLight: Color(0xFF424242),
          primaryColorDark: Color(0xFF1D1D1D),
          accentColor: Color(0xFFFFC491),
          scaffoldBackgroundColor: Color(0xFF2D2D2D)),
      home: DashboardPage(),
    );
  }
}