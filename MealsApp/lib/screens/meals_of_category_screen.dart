
import 'package:MealsApp/models/mealDetails.dart';
import 'package:MealsApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsOfCategoryScreen extends StatefulWidget {
  final List<MealDetails> availableMeals;


  MealsOfCategoryScreen(this.availableMeals);
  static const routeName = "/meals-of-category";

  @override
  _MealsOfCategoryScreenState createState() => _MealsOfCategoryScreenState();
}

class _MealsOfCategoryScreenState extends State<MealsOfCategoryScreen> {

  var _loadedInitData=false;
  String categoryTitle;
  List<MealDetails> mealsOfCategory;

  void _removeMeal(String mealId){
      
    setState(() {
      mealsOfCategory.removeWhere((element) => element.id==mealId);
    });

  }

  @override
  Widget build(BuildContext context) {
    if(!_loadedInitData){
    Map categoryArgs = ModalRoute.of(context).settings.arguments;

     categoryTitle = categoryArgs["title"];
    final String categoryId = categoryArgs["id"];
     mealsOfCategory = widget.availableMeals.where((mealElement) {
      return mealElement.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(removeItem: _removeMeal,
              title: mealsOfCategory[index].title,
              duration: mealsOfCategory[index].duration,
              complexity: mealsOfCategory[index].complexity,
              imageUrl: mealsOfCategory[index].imageUrl,
              affordability: mealsOfCategory[index].affordability,
              id: mealsOfCategory[index].id,
            );
          },
          itemCount: mealsOfCategory.length,
        ));
  }
}
