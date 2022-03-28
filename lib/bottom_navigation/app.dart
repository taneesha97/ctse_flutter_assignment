import 'package:ctse_assignment_1/bottom_navigation/tab_navigator.dart';
import 'package:ctse_assignment_1/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/userAuth/userauthentication.dart';
import 'live_view_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();

}

class AppState extends State<App> {
  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];

  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;


  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("Init State");
  }

  void loginValidation() {
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;
    val.listen((event) {
      print('============================== event email $event');
      if(event == null){
        //if the user object is null. will forward to Register page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loginValidation();
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
            children:<Widget>[
              _buildOffstageNavigator("Page1"),
              _buildOffstageNavigator("Page2"),
              _buildOffstageNavigator("Page3"),
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) { _selectTab(pageKeys[index], index); },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_one),
              label: 'Page1'
              //title: const Text('Page1'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_two),
                label: 'Page2'
              //title: new Text('Page2'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.looks_3),
                label: 'Page3'
              //title: new Text('Page3'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );

  }



  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
