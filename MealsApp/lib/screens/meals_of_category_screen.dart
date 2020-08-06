import 'package:MealsApp/dummy_data.dart';
import 'package:MealsApp/models/mealDetails.dart';
import 'package:MealsApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';


class MealsOfCategoryScreen extends StatelessWidget {
   static const  routeName= "/meals-of-category";
  
  // final String categoryTitle;
  // final String id;
  // MealsOfCategory({
  //   this.id,this.categoryTitle
  // });

  
  @override
  Widget build(BuildContext context) {
    Map categoryArgs =ModalRoute.of(context).settings.arguments;

    final String categoryTitle=categoryArgs["title"];
    final String categoryId=categoryArgs["id"];
    final List<MealDetails> mealsOfCategory=DUMMY_MEALS.where((mealElement) {
        return mealElement.categories.contains(categoryId);
    }).toList();

        return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body:ListView.builder(itemBuilder: (context,index){
        return MealItem(title: mealsOfCategory[index].title,duration:mealsOfCategory[index].duration,complexity: mealsOfCategory[index].complexity,imageUrl: mealsOfCategory[index].imageUrl,affordability: mealsOfCategory[index].affordability,);
      },
      itemCount:mealsOfCategory.length ,)
    );
  }
}