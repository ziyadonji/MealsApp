import 'package:flutter/material.dart';
import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudi',
      theme: ThemeData(
         primarySwatch: Colors.pink,
         accentColor: Colors.amber,
         fontFamily: "Raleway",
         textTheme: ThemeData.light().textTheme.copyWith(
           headline6: TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight:FontWeight.w500,
            fontSize: 20

           ),
         ),
      ),
      home: CategoriesScreen(),
    );
  }
}

