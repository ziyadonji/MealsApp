
import '../screens/meals_of_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem({
    this.color,
    this.title,
    this.id,
  });
  void selectCategory(ctx) {
    // Navigator.push(
    //   ctx,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => MealsOfCategory(
    //       categoryTitle: title,
    //       id: id,
    //     ),
    //   ),
    // );

    Navigator.pushNamed(
      ctx,
      MealsOfCategoryScreen.routeName,
      arguments: {"title": title, "id": id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectCategory(context);
      },
      splashColor: Colors.green,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.difference,
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
