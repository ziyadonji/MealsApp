import 'package:MealsApp/screens/meal_details_screen.dart';
import 'package:MealsApp/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/meals_of_category_screen.dart';

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
        "/":(context)=>TabsScreen(),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(),
        MealsOfCategoryScreen.routeName:(context)=>MealsOfCategoryScreen()
      },
      //on unknown route is used like 404 fallback in web..if routes are not availabe this is shown
      onUnknownRoute: (setting){
          return MaterialPageRoute(builder: (context){
            return CategoriesScreen();

          });
      },
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 255, 250, 1),
         primarySwatch: Colors.pink,
         accentColor: Colors.amber,
         fontFamily: "Raleway",
         textTheme: ThemeData.light().textTheme.copyWith(
           headline6: TextStyle(
             letterSpacing: 1.2,
            fontFamily: "RobotoCondensed",
            fontWeight:FontWeight.w500,
            fontSize: 15
            

           ),
           headline5: TextStyle(
             fontFamily: "RobotoCondensed",
             fontWeight:FontWeight.w500,
             fontSize: 25,
             letterSpacing: 1.5
           )
         ),
      ),
     
    );
  }
}

