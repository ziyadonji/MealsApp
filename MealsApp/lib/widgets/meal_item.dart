import 'package:MealsApp/models/mealDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MealItem extends StatelessWidget {
  final String title;
  final int duration;
  final Complexity complexity;
  final String imageUrl;
  final Affordability affordability;

  MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability

  });

  String get complexityText{
    switch(complexity){
      case Complexity.simple:
        return "Simple";
        break;
      case Complexity.challenging:
        return "Challenging";
        break;
      case Complexity.hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }
 

  //  String get affordabilityText{
  //   switch(affordability){
  //     case Affordability.cheap:
  //       return "Affordable";
  //       break;
  //     case Affordability.pricey:
  //       return "Pricey";
  //       break;
  //     case Affordability.luxurious:
  //       return "Costly";
  //       break;
  //     default:
  //       return "unknown";
  //   }
  // }

  void selectedMeal(){
  print(affordability);

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: selectedMeal,
     child: Card(
       margin: EdgeInsets.all(10),
       shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15),),
       elevation: 4,
        child:Column(
          children: <Widget>[
            Stack(
             children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(15),
                   topRight: Radius.circular(15)
                 ),
                 child: Image.network(imageUrl,width: double.infinity,height: 250,fit: BoxFit.cover,),
               ),
               Positioned(
                 bottom: 20,
                 right: 10,
                                child: Container(
                                  width: 230,
                  color: Colors.black54, 
                   padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                   child: Text(title,style:TextStyle(
                     color: Colors.white,
                     fontSize: 25,
                     fontFamily: "Raleway",
                      

                   ),
                   softWrap: true,
                   overflow: TextOverflow.fade,),
                 ),
               )

               
             ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               children: <Widget>[
                 Icon(Icons.schedule),
                 SizedBox(width:6),
                 Text('$duration min',)
               ],
             ),
             
           ),
            Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               children: <Widget>[
                 Icon(Icons.work),
                 SizedBox(width:6),
                 Text(complexityText)
               ],
             ),
             
           ),
            Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               children: <Widget>[
                 Icon(Icons.attach_money),
                 SizedBox(width:6),
                 //Text(affordabilityText)
               ],
             ),
             
           ),
         ],
       )
          ],
        ),

       
     ),


    );
  }
}