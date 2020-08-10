import 'package:MealsApp/models/mealDetails.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  
  final List<MealDetails> favouriteMeals;
  FavouritesScreen(this.favouriteMeals,);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

body: Center(child: Text(
      "favourite screen"
    ),),

    );
  }
}