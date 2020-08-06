import 'package:flutter/foundation.dart';

enum Complexity{
  simple,
  challenging,
  hard
}

enum Affordability{
  cheap,
  pricey,
  luxurious
}



class MealDetails{
   final String id;
   final String title;
   final String imageUrl;
   final List categories;
   final List steps;
   final List ingredients;
   final Complexity complexity;
   final Affordability affordability;
   final int duration;
   final bool isVegan;
   final bool isVegetarian;
   final bool isGlutenFree;
   final bool isLactoseFree;



   const MealDetails({
     @required this.id,
     @required this.title,
     @required this.affordability,
     @required this.categories,
     @required this.complexity,
     @required this.duration,
     @required this.imageUrl,
     @required this.ingredients,
     @required this.isGlutenFree,
     @required this.isLactoseFree,
     @required this.isVegan,
     @required this.isVegetarian,
     @required this.steps,
     

   });

}