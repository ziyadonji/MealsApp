import 'package:flutter/material.dart';


class MealsOfCategory extends StatelessWidget {
   static const  routeName= "meals-of-category";
  
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
        return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body:Center(
        child: Text('here are the recipies'),
      )
    );
  }
}