import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Controllers/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        fontFamily: "Roboto",
        iconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black)
        ),
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}