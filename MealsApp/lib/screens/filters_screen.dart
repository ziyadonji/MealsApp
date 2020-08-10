import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function setFilters;
  final Map <String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.setFilters,);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
var _glutenFree ;
  var _lactoseFree;
  var _isVegetarian;
  var _isVegan ;

 
  


  @override
  void initState() {
    _glutenFree = widget.currentFilters["glutenFree"];
   _lactoseFree = widget.currentFilters["lactoseFree"];
   _isVegetarian = widget.currentFilters["vegetarian"];
   _isVegan = widget.currentFilters["vegan"];

    
    super.initState();
  }
  

  Widget _buildSwitchListTile(providedValue, title, subtitle, onChanged) {
    return Column(
      children: [
        SwitchListTile(
          value: providedValue,
          onChanged: onChanged,
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: "RaleWay",
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(subtitle),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Divider(
            height: 0,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    "glutenFree": _glutenFree,
                    "lactoseFree": _lactoseFree,
                    "vegan": _isVegan,
                    "vegetarian": _isVegetarian,
                  };

                  widget.setFilters(selectedFilters);
                })
          ],
          title: Text("Your Filters"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Text("Select Your Meal Preferances",
                  style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    _glutenFree,
                    "Gluten Free",
                    "Display only Gluten-free food",
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    _lactoseFree,
                    "Lactose Free",
                    "Display only Lactose-free food",
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    _isVegan,
                    "Vegan",
                    "Display only Vegan food",
                    (newValue) {
                      setState(
                        () {
                          _isVegan = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    _isVegetarian,
                    "Vegetarian ",
                    "Display only Vegetarian food",
                    (newValue) {
                      setState(
                        () {
                          _isVegetarian = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
