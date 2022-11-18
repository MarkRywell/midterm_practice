import 'package:flutter/material.dart';
import 'package:midterm_practice/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blueGrey
      ),
    ),
    home: HomePage()
  ));
}

