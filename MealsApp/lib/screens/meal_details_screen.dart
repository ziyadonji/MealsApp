import 'package:MealsApp/models/mealDetails.dart';
import 'package:flutter/material.dart';

import '../models/mealDetails.dart';


class MealDetailScreen extends StatelessWidget {
  final Function toggleFavourite;
  final List<MealDetails> favouriteMeals;
  final List<MealDetails> _availableMeals;
  MealDetailScreen(this._availableMeals,this.toggleFavourite,this.favouriteMeals);
  static const routeName = "/meals_of_category_screen/meal_details_screeen";

  Widget buildSectionTitle(BuildContext context, String heading) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(heading, style: Theme.of(context).textTheme.headline5),
    );
  }
  
  Widget buildContainer(Widget child){
    return  Container(
                      padding: EdgeInsets.all(5),
                      height:200,
                      width:300,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        
                       
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black26)
                      ),
                      child: child
                    );
  }
 

  bool isFavourite(String id){
    
     return favouriteMeals.any((element) => element.id==id);
  }
 @override

  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments;
    final MealDetails selectedMeal = _availableMeals.firstWhere((mealElement) {
      return mealElement.id == mealId;
    });
    final appBar = AppBar(
      title: Text(selectedMeal.title),
      elevation: 0,
    );
    return Scaffold(
        appBar: appBar,
        floatingActionButton: FloatingActionButton(
          child: Icon(isFavourite(mealId)?Icons.star:Icons.star_border),
          onPressed: (){
            toggleFavourite(mealId);
          },
        ),
        body: 
            //Text("Ingredients",style:Theme.of(context).textTheme.headline5),

            SingleChildScrollView(
              // child: Container(
              // height:MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-180-appBar.preferredSize.height-10,
              child: Column(
                children: [
                   ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(selectedMeal.imageUrl,
                    height: 180, width: double.infinity, fit: BoxFit.cover)),

                  buildSectionTitle(context, "Ingredients"),
                  // buildContainer(ListView.builder(
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //           child: Column(
                  //             children: <Widget>[
                  //               Text(
                  //                 selectedMeal.ingredients[index],
                  //                 style: Theme.of(context).textTheme.headline6,
                  //               ),
                  //               Divider(),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //       physics: ClampingScrollPhysics(),
                  //       shrinkWrap: true,
                  //       itemCount: selectedMeal.ingredients.length,
                  //     ),),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                  
                                    selectedMeal.ingredients[index],
                                    style: Theme.of(context).textTheme.headline6,

                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: selectedMeal.ingredients.length,
                        ),
                      ),
                  buildSectionTitle(context, "Steps"),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                selectedMeal.steps[index],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: selectedMeal.steps.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                  // buildContainer(ListView.builder(
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //       child: Column(
                  //         children: <Widget>[
                  //           Text(
                  //             selectedMeal.steps[index],
                  //             style: Theme.of(context).textTheme.headline6,
                  //           ),
                  //           Divider(),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  //   itemCount: selectedMeal.steps.length,
                  //   shrinkWrap: true,
                  //   physics: ClampingScrollPhysics(),
                  // ))
                  
                ],
              ),
            ),

            // ListView(
            //   children: <Widget>[
            //     Text("Ingredients",
            //         style: Theme.of(context).textTheme.headline5),
            //     Card(
            //       margin: EdgeInsets.all(10),
            //       child: ListView.builder(
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            //             child: Column(
            //               children: <Widget>[
            //                 Text(
            //                   selectedMeal.ingredients[index],
            //                   style: Theme.of(context).textTheme.headline6,
            //                 ),
            //                 Divider(),
            //               ],
            //             ),
            //           );
            //         },
            //         shrinkWrap: true,
            //         itemCount: selectedMeal.ingredients.length,
            //       ),
            //     ),
            //     Text("Recipe", style: Theme.of(context).textTheme.headline5),
            //     ListView.builder(
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            //           child: Column(
            //             children: <Widget>[
            //               Text(
            //                 selectedMeal.steps[index],
            //                 style: Theme.of(context).textTheme.headline6,
            //               ),
            //               Divider(),
            //             ],
            //           ),
            //         );
            //       },
            //       itemCount: selectedMeal.steps.length,
            //       shrinkWrap: true,
            //     )
            //   ],
            //   shrinkWrap: true,
            // )
          
        );
  }
}
