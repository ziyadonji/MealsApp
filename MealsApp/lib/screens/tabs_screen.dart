import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import "./categories_screen.dart";
import './favouritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavouritesScreen(), "title": "Your Favourites"},
  ];

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TabBar view below the appbar

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Fuddi'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorites",
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavouritesScreen(),
    //     ]),
    //   ),
    // );

    //at the bottom of the page

    return Scaffold(
     drawer:MainDrawer() ,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(

              //backgroundColor: Theme.of(context).primaryColor,(needed onle if type is bottomNavigationBar.shifting)
              icon: Icon(Icons.category),
              title: Text(
                "Categories",
                style: TextStyle(fontFamily: "RobotoCondensed"),
              )),
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text(
                'Favourites',
                style: TextStyle(fontFamily: "RobotoCondensed"),
              )),
        ],
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        //type: BottomNavigationBarType.shifting,
        onTap: _selectedPage,
        backgroundColor:Colors.white,
      ),
      body: _pages[_selectedPageIndex]["page"],
    );
  }
}
