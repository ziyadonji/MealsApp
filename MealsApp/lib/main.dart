import 'package:flutter/material.dart';
import './categories_screen.dart';
import './meals_of_category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Fudi',
      //  home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/":(context)=>CategoriesScreen(),
        MealsOfCategory.routeName:(context)=>MealsOfCategory()
      },
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 255, 250, 1),
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
     
    );
  }
}

