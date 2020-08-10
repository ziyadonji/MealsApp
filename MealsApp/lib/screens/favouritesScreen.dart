import 'package:MealsApp/models/mealDetails.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  
  final List<MealDetails> favouriteMeals;
  FavouritesScreen(this.favouriteMeals,);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

// body: Center(child: Text(
//       "favourite screen"
//     ),),

body:ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: favouriteMeals[index].title,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              imageUrl:favouriteMeals[index].imageUrl,
              affordability: favouriteMeals[index].affordability,
              id: favouriteMeals[index].id,
            );
          },
          itemCount: favouriteMeals.length,
        )


    );

}}