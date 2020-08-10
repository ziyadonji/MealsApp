import 'package:MealsApp/dummy_data.dart';
import 'package:MealsApp/models/mealDetails.dart';
import 'package:MealsApp/screens/filters_screen.dart';
import 'package:MealsApp/screens/meal_details_screen.dart';
import 'package:MealsApp/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/meals_of_category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealDetails> _availableMeals = DUMMY_MEALS;
  List<MealDetails> _favouriteMeals=[];

void toggleFavourite(String id){
setState(() {
   final existingIndex=_favouriteMeals.indexWhere((element){
     return element.id==id;
   });
   if (existingIndex>=0){
     _favouriteMeals.removeAt(existingIndex);

   }
   else{
     _favouriteMeals.add(
       DUMMY_MEALS.firstWhere((element) => element.id==id)
     );
   }
  
});
  
}





  Map<String, bool> filters = {
    "glutenFree": false,
    "lactoseFree": false,
    "vegan": false,
    "vegetarian": false,
  };

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters["glutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (filters["lactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        if (filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudi',
      //  home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreen(_favouriteMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_availableMeals,toggleFavourite,_favouriteMeals),
        MealsOfCategoryScreen.routeName: (context) =>
            MealsOfCategoryScreen(_availableMeals),
        FiltersScreen.routeName: (context) => FiltersScreen(filters,setFilters)
      },
      //on unknown route is used like 404 fallback in web..if routes are not availabe this is shown
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) {
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
                fontWeight: FontWeight.w500,
                fontSize: 15),
            headline4: TextStyle(
                letterSpacing: 1.2,
                fontFamily: "RaleWay",
                fontWeight: FontWeight.bold,
                fontSize: 25),
            headline5: TextStyle(
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.w500,
                fontSize: 25,
                letterSpacing: 1.5)),
      ),
    );
  }
}
