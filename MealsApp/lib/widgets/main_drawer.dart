
import 'package:MealsApp/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10
      ),
      child: ListTile(
        onTap: tapHandler,
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(title,
            style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 22,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Cooking Up !!",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontFamily: "RobotoCondensed",
                      fontWeight: FontWeight.w900)),
            ),
          ),
          SizedBox(height:20),
          _buildListTile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Divider(
              height: 0,
            ),
          ),
          _buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }
}
