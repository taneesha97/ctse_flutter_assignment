import 'package:ctse_assignment_1/screens/index_page.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:flutter/material.dart';

import 'movie_all.dart';
import 'movie_wiki.dart';


class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    IndexPage(),
    DropDown(),
    AllMovieScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'UI1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'UI2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'UI3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
